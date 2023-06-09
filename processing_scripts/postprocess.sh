# en-es

SL=en
TL=es
CORPUS=netflix

mkdir -p ../mt_postprocessed/$CORPUS/$SL-$TL

SYSTEM_ARR=(aws deepl gt msft openai)

for SYS_NAME in ${SYSTEM_ARR[@]}
do

	SRC_PATH="../mt_outputs/$CORPUS/$SL-$TL/$CORPUS.$SL-$TL.$SYS_NAME.$TL"
	TRG_PATH="../mt_postprocessed/$CORPUS/$SL-$TL/$CORPUS.$SL-$TL.$SYS_NAME.$TL"
	python  postprocess.py  $SRC_PATH  $TRG_PATH

done

