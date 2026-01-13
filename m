Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685E834F256;
	Tue, 13 Jan 2026 21:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768340988; cv=none; b=unwwc7rs+w0BZlKmJM82STUEQ2fW/ef3vfSUNOhyeymDHOToqZRoabZD+GOKa3FAiI8jnHHPTHrq67yoOstJRkQZbDeexbnP0Ft6ANBwJfMjCDqbgk6Q76vOc+jIPRvla6q/NyHgm5PdbAUuGh4lDUMj2SMIZfdozWT5q5Jheus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768340988; c=relaxed/simple;
	bh=+pubfcq/fHKvX+Jxi5hGDgx8nbfdO4yelnz7e6o6ytA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nQLH0Hqc7kpt/VPmpQAmbMUmKxUUzQ9Zq1RbfWtI61ncWUBfbknSAdo0LjhuFjfuooSlg2m068UBAY5xVeGPT2yS4fuKrVYqoZ/rO+hs6KL0szUCUwh/x4GQpmgmG8EuDa7ohpSe6cZZJYlwF31nupNJEMtcLLYiWPeymMrJDdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p30rYLmW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p30rYLmW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C889EC116C6;
	Tue, 13 Jan 2026 21:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768340988;
	bh=+pubfcq/fHKvX+Jxi5hGDgx8nbfdO4yelnz7e6o6ytA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=p30rYLmWhAGyFGwrARGUWdRgJOdoqhH/CVyC67IEPD+oNOwkyxnjrLFW14NOAVIJG
	 0gZR54xkIEuUpvYS7UJYaTAhDyd/zwGu2PR+rUhRPDi7IvoEx0oTxS6+i1SzwPKyQz
	 0V7BKGvtveRf6Hh5FJ6DFJ3spg0NZZG+NGvI3//Z6CIlugqQUgqFwgQLRzQc/Igse0
	 jTRwS6tdfFwh75FbHcqtldYHSpk4MHRHP3wUGT/X0/LXBLMZwosvBWxEUic2SC57tG
	 teVBxC0sJdGDL2DS2yPl7pfUn1HwEK1PFZdjmL5m96uDQa5OfMXq9ZZ17/vde9W6Kf
	 8hFGyxtPYGE9A==
Date: Tue, 13 Jan 2026 22:49:43 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Shuah Khan
 <skhan@linuxfoundation.org>
Subject: Re: [PATCH v3 4/4] scripts/kernel-doc: some fixes to kernel-doc
 comments
Message-ID: <20260113224943.3e8b014c@foz.lan>
In-Reply-To: <87sec9w7ux.fsf@trenco.lwn.net>
References: <cover.1768324572.git.mchehab+huawei@kernel.org>
	<434e60e7868ef4e001e81e8cfa872dec711ddd34.1768324572.git.mchehab+huawei@kernel.org>
	<87sec9w7ux.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Tue, 13 Jan 2026 13:55:18 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
>=20
> > There are some typos and English errors at the kernel-doc.py comments.
> >
> > Locate them with the help of LLM (gpt-oss 14B), locally excecuted
> > with this prompt:
> >
> >     review English grammar andsyntax at the comments on the code
> >     below:
> >     <cat scripts/kernel-doc.py>
> >
> > Not all results are flowers, although it caught several minor
> > issues there. Add the pertinent fixes, discarding the bad ones. =20
>=20
> "flowers"?  Did the LLM put that out too? :)

No, you should blame me for the description ;-) I didn't ask LLM
to write it for me. On past experiments, LLM is not great writing
texts - specially with open models that run fine with 16GB VRAM.
I might have asked it to review(*).

I was trying to say that: while LLM worked fine for the task of
doing an English grammar review for the strings, being able to
distinguish them from the actual code, it was not is perfect:=20
some things required manual work to fix.

(*) asking it to review with this prompt:

	"review the test below and produce a version with English spelling fixed:
	 <patch description>"

Gave:

	"There are some typos and English errors in the comments of kernel=E2=80=
=91doc.py.

	 Locate them with the help of an LLM (gpt=E2=80=91oss 14B), executed local=
ly with this prompt:
=20
	review English grammar and syntax at the comments on the code below:
	<cat scripts/kernel-doc.py>

	Not all results are perfect, although the LLM caught several minor issues.
	Add the relevant fixes, discarding the incorrect ones."

Asking it to explain what changed with:

	"what changes you did? why?"  (**)

using ollama with gpt-oss:latest (14B) gave:

<llm_output>
Changes I made to the test text
-------------------------------

+---+---------------------+-----------------+--------------------------+
| # | Original phrase     | Fixed phrase    | Why it was changed       |
+=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
| 1 | ``excecuted``       | ``executed``    | Misspelling of           |
|   |                     |                 | *executed*.              |
+---+---------------------+-----------------+--------------------------+
| 2 | ``synatx``          | ``syntax``      | Misspelling of *syntax*. |
+---+---------------------+-----------------+--------------------------+
| 3 | ``review English    | ``review        | Added a space between    |
|   | grammar andsyntax`` | English grammar | *grammar* and *syntax*   |
|   |                     | and syntax``    | and kept the             |
|   |                     |                 | capitalization           |
|   |                     |                 | consistent.              |
+---+---------------------+-----------------+--------------------------+
| 4 | ``there.``          | ``there.`` (no  | The original had an      |
|   |                     | change needed)  | extraneous period after  |
|   |                     |                 | =E2=80=9Cthere=E2=80=9D.     =
            |
+---+---------------------+-----------------+--------------------------+
| 5 | ``Not all results   | *Unchanged*     | The phrase is            |
|   | are flowers``       | (this is a      | intentional (=E2=80=9Cflowers=
=E2=80=9D   |
|   |                     | playful phrase; | as a metaphor).          |
|   |                     | kept as=E2=80=91is.)    |                      =
    |
+---+---------------------+-----------------+--------------------------+
| 6 | ``although it       | ``although      | No change=E2=80=94just added =
the |
|   | caught several minor| it caught       | missing period at the    |
|   | issues there.``     |  several minor  | end for completeness.    |
|   |                     | issues there.`` |                          |
+---+---------------------+-----------------+--------------------------+
| 7 | ``Add the pertinent | ``Add the       | No spelling/grammar      |
|   | fixes, discard      | pertinent fixes,| issue; kept for clarity. |
|   | ing the bad ones.`` | discarding      |                          |
|   |                     | the bad ones.`` |                          |
+---+---------------------+-----------------+--------------------------+

Why these changes were made
---------------------------

  - Spelling =E2=80=93 The text contained a handful of typographical errors=
=20
    (excecuted, synatx). Fixing them prevents confusion and gives=20
    the reader confidence in the quality of the documentation. =20

  - Punctuation =E2=80=93 Adding a period after the final sentence makes the
    paragraph a complete statement. =20

  - Clarity =E2=80=93 Adding a space between grammar and syntax keeps the=20
    instruction legible. =20

  - Professional tone =E2=80=93 Corrected wording preserves the informal =
=E2=80=9Cflowers=E2=80=9D
    metaphor while ensuring that the rest of the instruction reads cleanly.
</llm_output>

Not a bad review.

Funny enough, on (5) it understood my metaphor, but it ended replacing
it to "Not all results are perfect", probably to give a "professional
tone".

(**) Yeah, that prompt is grammatically incorrect: I should have used=20
     "did you do?" but, as I'm playing with LLM, I like to write prompts
     with typos and other problems to see how well a 14B or less models
     would get it right :-D

     Sometimes I even change my language during prompts... it is funny
     that sometimes it follows my lead and change the language as well,
     while, on others, it keeps using the initial language... I even got
     a case were it randomly switched to a completely different language.
    =20
> The changes themselves look fine.

Good! want me to send a new version to improve description?

Thanks,
Mauro
