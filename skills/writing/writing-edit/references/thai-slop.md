# Thai slop patterns

Phrasings that make Thai prose read machine-written or like a corporate press release. Each entry: the pattern, why it reads badly, and the usual fix. The fix is a rewrite of the sentence, not a deletion of the phrase.

## Empty openers and closers

- **บทความนี้จะพาไป... / วันนี้เราจะมาดูกัน... / มาเริ่มกันเลย**: announces the post instead of starting it. Fix: start with the first real sentence.
- **ในยุคปัจจุบันที่เทคโนโลยี... / ในโลกที่เปลี่ยนแปลงอย่างรวดเร็ว**: a frame no reader needed. Fix: delete; open on the specific.
- **หวังว่าบทความนี้จะเป็นประโยชน์ / ขอบคุณที่อ่านจนจบ**: the reader knows they finished. Fix: end on the last real point, or a question the author still has.
- **สรุปก็คือ / โดยสรุปแล้ว** followed by a restatement: Fix: cut the summary unless the post is long enough to need one.

## Nominalised bureaucratese

- **ทำการ + verb** (ทำการติดตั้ง, ทำการตรวจสอบ): Fix: the verb alone (ติดตั้ง, ตรวจ).
- **ได้มีการ + noun** (ได้มีการแก้ไข): Fix: say who did what (ผมแก้).
- **มีความ + adjective** (มีความสำคัญ, มีความซับซ้อน): Fix: the adjective (สำคัญ, ซับซ้อน), or show why.
- **การ/ความ stacked** (การดำเนินการการตรวจสอบ): Fix: rewrite around a verb.
- **ในส่วนของ / ในเรื่องของ / ทางด้าน** before a noun that needs no frame: Fix: drop the frame (ในส่วนของ API ที่ทำ -> API ที่ทำ).
- **เป็นสิ่งที่ + verb** (เป็นสิ่งที่ต้องระวัง): Fix: ต้องระวัง.

## Translated-English structure

- **ถูก + verb** passive where Thai uses active or no marker (ไฟล์ถูกสร้างโดยสคริปต์): Fix: สคริปต์สร้างไฟล์. Keep ถูก only for something bad happening to someone.
- **ซึ่ง** chains, one relative clause hung off another: Fix: split into sentences.
- **ไม่ใช่แค่ X แต่ยังเป็น Y**: the contrast is usually manufactured. Fix: say Y.
- **Three-item lists for rhythm** (เร็ว ง่าย และปลอดภัย) where only one is backed: Fix: keep the one with evidence.
- **Colon headline bullets** (**ประสิทธิภาพ:** ...) in running prose: Fix: write the paragraph.

## Inflated weight

- **ถือได้ว่า / นับว่าเป็น / เรียกได้ว่า / อย่างยิ่ง / อย่างมาก**: hedges or boosts with nothing behind them. Fix: delete, or give the number.
- **สิ่งที่น่าสนใจคือ / ที่น่าทึ่งก็คือ**: tells the reader how to feel. Fix: state the thing; if it is interesting, they will notice.
- **ปฏิวัติ / พลิกโฉม / game changer / ทรงพลัง**: Fix: describe what changed and by how much.
- **อย่างไรก็ตาม / นอกจากนี้ / ทั้งนี้ / ดังนั้นจึง** opening most paragraphs: connectors standing in for logic. Fix: keep one only where the logic actually turns.

## Hedging and false balance

- **อาจจะ...ได้ / ในบางกรณี / ขึ้นอยู่กับหลายปัจจัย** on a claim the author knows: Fix: say what it depends on, or commit.
- **ทั้งข้อดีและข้อเสีย** sections that list both evenly when the author has a view: Fix: give the view, then the honest counterpoint.

## Register and terms

- **Over-translated terms** (ตัวจัดการสถานะ for state management, การปรับใช้ for deploy): Thai tech readers say the English. Fix: keep the term in English, as the author would say it aloud.
- **Register drift**: formal ท่านผู้อ่าน in one paragraph, เรา/ผม casual in the next. Fix: pick the author's register from voice.md and hold it.
- **Particles pasted on for warmth** (นะครับ/นะคะ on every sentence, เลย/กันเลย/ล่ะ stacked): Fix: keep where the author would say it out loud, usually rarely.
- **Emoji as headings or bullets**: Fix: remove unless voice.md shows the author uses them.

## Punctuation

- **Em dash (—) as the default joiner**: rare in natural Thai. Fix: a space, a new sentence, or วงเล็บ.
- **Exclamation marks after ordinary statements**: Fix: remove.
- **English quotation habits around every term** ("cache", "deploy"): Fix: quote only on first use of a coined name, or not at all.
