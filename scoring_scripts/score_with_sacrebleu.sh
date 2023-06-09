# en-es

SL=en
TL=es
CORPUS=netflix

mkdir -p ../scoring_outputs/$CORPUS/$SL-$TL

REF_PATH=../corpora_preprocessed/$CORPUS/$SL-$TL/"$CORPUS"_edited_split.$SL-$TL.$TL
#REF_PATH="../corpora_preprocessed/$CORPUS/$SL-$TL/$CORPUS.$SL-$TL.$TL"
TRG_PREFIX="../mt_postprocessed/$CORPUS/$SL-$TL"
OUT_PATH="../scoring_outputs/$CORPUS/$SL-$TL/sacrebleu-score.$CORPUS.$SL-$TL.txt"

echo "Writing scores to $OUT_PATH"
sacrebleu $REF_PATH \
       -i $TRG_PREFIX/$CORPUS.$SL-$TL.aws.$TL \
	  $TRG_PREFIX/$CORPUS.$SL-$TL.deepl.$TL \
	  $TRG_PREFIX/$CORPUS.$SL-$TL.gt.$TL \
	  $TRG_PREFIX/$CORPUS.$SL-$TL.msft.$TL \
	  $TRG_PREFIX/$CORPUS.$SL-$TL.openai.$TL \
       -m bleu chrf ter --chrf-word-order 2 \
	  2>&1 | tee $OUT_PATH

	  #$TRG_PREFIX/$CORPUS.$SL-$TL.openai.$TL \
