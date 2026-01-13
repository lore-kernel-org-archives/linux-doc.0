Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E680C195811
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 22:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768344487; cv=none; b=NLEEj6wfo08IsDe4HVJ1tRv0Y4tmLhqBO480kYb+zoQo+i3qQ1ylJfaiPI245d49+WLlXow0F7v2BECylyhQfXL5AjuDgSRp2rHicoee0qb+gECGvfufZB4n+RStBB6euuKPktWcP6WDKm8pagoSFPGeX38eOJ8s38gamstaoFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768344487; c=relaxed/simple;
	bh=2S7YO4UHc/6bspphTqGerGGfx6FH/6kIHg+nVE2V+JM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UmXE1eMQ9PX799rft+emMw89zqzlygLoWlBfkwNBm8ZazUlE1KqLPdgMInThta/1xJMPaaDceiuQKTBOgfe2lANle1OA2WodPcW/0RROpobLWIPi7SADYXpXBqGPOD7go7wwzQhQD8S0EOjTWZepuhZBnNfRG0iHE9Izr0yRjso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BH/F8pT5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BH/F8pT5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D60BBC116C6;
	Tue, 13 Jan 2026 22:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768344486;
	bh=2S7YO4UHc/6bspphTqGerGGfx6FH/6kIHg+nVE2V+JM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BH/F8pT5BMfrkmBB+Et3Cl4wR9WV90TytmBuRT0Xmf4zGbGtpjvJzLfhIOsO0eW7e
	 gBXPJmh20k8kasaw2/rLbsV+5Fp/wbv1HcGJttw6KTPnXgsgI+fHp0MYuQA6jIut9e
	 vGMZMQVC2J9IYLq47C47/BNFEpPKj6zuQN0RwoyRMh9gVGaWSehgCzfhiu6uXMHqLU
	 MWHtvZzS2Ct17Q+j33zjnbK8JT90M1zL/P+3/kqBYIEsKFmG6Z38V2uxKprUIRQ4xD
	 nk1gPDgC3kFCu1tJLW+i7DjD+H9/bvu9DZ1jS4NzBzAMc9IevZiN7SBqiRC0pz/0V8
	 Bu5qewwIxMu/g==
Date: Tue, 13 Jan 2026 23:48:03 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: OOT: some LLM-generated humor over a patch description - Was: Re:
 [PATCH v3 4/4] scripts/kernel-doc: some fixes to kernel-doc comments
Message-ID: <20260113233709.28ec384f@foz.lan>
In-Reply-To: <20260113231036.0b10f4a9@foz.lan>
References: <cover.1768324572.git.mchehab+huawei@kernel.org>
	<434e60e7868ef4e001e81e8cfa872dec711ddd34.1768324572.git.mchehab+huawei@kernel.org>
	<87sec9w7ux.fsf@trenco.lwn.net>
	<20260113224943.3e8b014c@foz.lan>
	<20260113231036.0b10f4a9@foz.lan>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Tue, 13 Jan 2026 23:10:36 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Em Tue, 13 Jan 2026 22:49:43 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:
>=20
> > Em Tue, 13 Jan 2026 13:55:18 -0700
> > Jonathan Corbet <corbet@lwn.net> escreveu:
> >=20
> > > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> > >  =20
>=20
> > > "flowers"?  Did the LLM put that out too? :) =20
>=20
> Heh, asking it to be funny and use figures of speech gave a funny
> yet precise description:

Heh, apparently I had nothing to do this night and decided to
see how LLM can play converting a patch description to something
different.

Feel free to Ignore this e-mail except if you're curious enough to see=20
what can be produced on my local GPU.


---

Original patch description:

<description>
There are some typos and English errors at the kernel-doc.py comments.

Locate them with the help of LLM (gpt-oss 14B), locally excecuted
with this prompt:

    review English grammar andsyntax at the comments on the code
    below:
    <cat scripts/kernel-doc.py>

Not all results are flowers, although it caught several minor
issues there. Add the pertinent fixes, discarding the bad ones.
</description>

I asked gpt-oss to modify them to different styles, after those
initial prompts:

prompt 1: rewrite the text abusing with Figures of speech and being funny
prompt 2: write just the original text converted with metaphors. Place in a=
 code block

(I placed already the results for it)

Then, I submitted some other prompts, asking to modify it to
several different styles:

1) The Fresh Prince of Bell-air
-------------------------------

Prompt: modify it to use =E2=80=9Cthe fresh prince of bell-air=E2=80=9D hum=
or:

<llm>
	Yo, what's up? Look, there are some miss=E2=80=91spelled words and grammar=
 ghouls hiding in the kernel=E2=80=91doc.py comments.=20
	It's like my dad's closet=E2=80=94full of half=E2=80=91forgotten stuff.=20
	So let's roll up a fresh 14=E2=80=91billion=E2=80=91parameter LLM (think o=
f it as the Fresh Prince's ride) and run it locally.=20
	Tell it, =E2=80=9CCheck my grammar and syntax in the comments below, just =
like I check my reflection in the mirror.=E2=80=9D

	    review English grammar and syntax at the comments on the code below:
	    <cat scripts/kernel-doc.py>

	The LLM didn't just spit out a rose=E2=80=91filled bouquet; it found a few=
 wilted flowers=E2=80=94some minor issues, no biggie.=20
	Grab the good ones, toss the bad ones out, and keep the code as clean as a=
 fresh pair of Jordans on the block.=20
</llm>

2) Shakespearean style (LLM suggestion)
---------------------------------------

prompt: Could you rewrite the same message in a Shakespearean style instead=
 of Fresh Prince?

<llm>
Hark! There be misspelt words and errant syntax lurking within the comments=
 of kernel=E2=80=91doc.py,
as if ghosts in a moonlit chamber. =20
Summon then a mighty LLM (gpt=E2=80=91oss 14B), as if a wizard of old, and =
run it anon upon the local realm,
with this solemn utterance:

    review English grammar and syntax at the comments on the code below:
    <cat scripts/kernel-doc.py>

The oracle returned no perfumed roses; it uncovered but a few wilted blooms=
=E2=80=94mere minor faults, indeed.
Gather the sweet ones, cast aside the withered, and let thy code shine as a=
 polished shield beneath the sun. =20
</llm>

3) for the the dress like a pirate day (LLM suggestion)
-------------------------------------------------------

prompt: Could you rewrite the message in a pirate=E2=80=91literate style?

<llm>
Arrr, me hearties! =20
Yar, there be misspelt words and bally syntax buried in the kernel=E2=80=91=
doc.py comments =E2=80=93 like doubloons in a sun=E2=80=91baked chest. =20
Summon ye a mighty LLM (gpt=E2=80=91oss 14B), as stout as a kraken, and run=
 it locally upon yer rigging with this command: =20

    review English grammar and syntax at the comments on the code below:
    <cat scripts/kernel-doc.py>

The beast returned no fragrant roses, but spied a few wilted blooms =E2=80=
=93 minor squalls, aye. =20
Collect the gold, toss the rotten, and let yer code sail smooth as a polish=
ed hull. =20
</llm>

4) noir detective (LLM suggestion)
----------------------------------

prompt: Can you rewrite the message in a noir detective style?

<llm>
I was staring at the back=E2=80=91lit screen of kernel=E2=80=91doc.py, the =
comments crawling like neon=E2=80=91glowing alley cats. =20
Something was off =E2=80=93 misspelt words, syntax that smelled of bad coff=
ee. =20
I knew the only way to clean up the mess was to bring in the big guns. =20

So I pulled out the LLM (gpt=E2=80=91oss 14B), a private eye with a 14=E2=
=80=91billion=E2=80=91parameter brain, and set it to work right there in my=
 office. =20
With a cigarette in one hand and a keyboard in the other, I told the machin=
e: =20

    review English grammar and syntax at the comments on the code below:
    <cat scripts/kernel-doc.py>

The LLM didn't give me a bouquet of roses =E2=80=93 it found a handful of w=
ilted blooms, minor issues that could have turned the whole case sour. =20
I snatched up the good ones, tossed the bad into the trash, and let the cod=
e breathe again, clean and sharp as a well=E2=80=91sharpened revolver in a =
rain=E2=80=91slick night. =20
</llm>

5) Buffy the Vampire Slayer
---------------------------

by purpose, I used the wrong name on this TV series

prompt 1: what if it was part of buffy the vampire hunter script?
prompt 2: convert it into a description that buffy is doing to Angel about =
a past hunt


<llm>
**Buffy=E2=80=99s Tale of the =E2=80=9CKernel=E2=80=91Doc=E2=80=9D Hunt**

When Buffy approached Angel one night, her eyes still glittered with the af=
ter=E2=80=91glow of a successful hunt. She leaned in, elbows on the battere=
d wooden desk, and began to recount the latest battle=E2=80=94a hunt that, =
oddly enough, had started with a line of code rather than a silver stake.

=E2=80=9CFirst thing I noticed,=E2=80=9D she said, tapping her fingers agai=
nst the monitor, =E2=80=9Cwas that the victim=E2=80=99s lair=E2=80=94well, =
*kernel=E2=80=91doc.py*=E2=80=94was littered with typo=E2=80=91tombs and sy=
ntax=E2=80=91slugs.=E2=80=9D She paused, watching Angel=E2=80=99s skeptical=
 gaze. =E2=80=9CI mean, who writes code like that when they=E2=80=99re abou=
t to unleash a demon?=E2=80=9D

Angel shifted, his winged silhouette casting a long shadow across the wall.=
 =E2=80=9CDid you just=E2=80=A6 fight a ghost in a file?=E2=80=9D

Buffy smiled, a flash of mischievous humor in her voice. =E2=80=9CNot a gho=
st, but a *vampire of the void*=E2=80=94the sort of entity that lingers in =
the shadows of poorly written scripts. I pulled out my trusty LLM, *gpt=E2=
=80=91oss=E2=80=9114B*, a 14=E2=80=91billion=E2=80=91parameter AI with a ta=
ste for order. I ran it locally, fed it the code with a simple prompt: =E2=
=80=9Creview English grammar and syntax at the comments on the code below,=
=E2=80=9D and waited.=E2=80=9D

She described how the AI combed through the comments like a detective sifti=
ng through evidence. =E2=80=9CIt wasn=E2=80=99t a bouquet of roses,=E2=80=
=9D she laughed, =E2=80=9Cbut it did flag a handful of minor glitches=E2=80=
=94those little syntax errors that could have turned a tidy codebase into a=
 chaotic battlefield.=E2=80=9D

Angel nodded, eyes widening as the picture painted itself. =E2=80=9CSo you =
used a language model to debug the demon=E2=80=99s lair?=E2=80=9D

=E2=80=9CExactly,=E2=80=9D Buffy confirmed. =E2=80=9CI cherry=E2=80=91picke=
d the clean fixes, threw the corrupted ones out, and the code=E2=80=94our l=
ast line of defense=E2=80=94was restored to pristine condition. The demon d=
idn=E2=80=99t stand a chance against an algorithmically flawless script.=E2=
=80=9D

She paused, looking at Angel, her tone turning reflective. =E2=80=9CThat ni=
ght, I realized that sometimes the real monsters we fight are the invisible=
 ones in our systems. And with the right tools=E2=80=94human ingenuity and =
machine precision=E2=80=94you can patch up the weak spots before they=E2=80=
=99re exploited.=E2=80=9D

Angel, ever the philosophical one, smiled. =E2=80=9CSo in the end, you save=
d the day by cleaning up a file instead of a coffin?=E2=80=9D

Buffy grinned. =E2=80=9CThat=E2=80=99s one way to put it.=E2=80=9D
</llm>

Thanks,
Mauro

