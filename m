Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AE64A0C
	for <linux-doc@vger.kernel.org>; Wed, 16 Oct 2024 04:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729052121; cv=none; b=EP665Glxgv62oklfrJNerGUCynV0UF2JMAOWn9LP5mrjuNRnMViPU6Ra95Sfz0aQCL6H1X3dcbjgC1aNtR9RbVObt3tJNJyBU7XOylIGqKiqRlDouABLiRpL4BXF4seuH1vagwb3q2sTLv6RNsXzMx5+Z2cWwtfnJc9ixkuagEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729052121; c=relaxed/simple;
	bh=wgQQdOWRC25JFUOu9ttiBiTlEOY8XQwqpVLQtRLhHSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mv8lDNBTs0RFIEB8TKy0F403W9pXbms1hgNV/p8p6miVZFQLiTpc53mgwlipg7Oxy4UYQsbGFy9t5sx/oK78lcHd66u8P4ELMpZ7xv1OZe9g6sB8gfhM+BtOIKyvlwbrVKMwbF4igl5QfGCKxh+V0ZyIGEN4NUmqmXJBUzOGFZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=G91CYnUU; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G91CYnUU"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5369f1c7cb8so7811401e87.1
        for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 21:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729052117; x=1729656917; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7oPk/m2XMb4zsXmOAcwGnkWPDKTdvg1ghHpep5dVFg=;
        b=G91CYnUUCak9ANpuDbLvmDtCll2BNZbI01YsnmxdMB0GBx0KI3FWA3Lr1eMGgAtqcQ
         tnt+7E3KqIthIEKcHtNfAOFjHki7R6eu+fiX7w3RK+TR7vnrJ7xFXItVObjfjMt8yT68
         f3h3Hnhc3UAezVgsim3J8iil5wvkPBWAHqBEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729052117; x=1729656917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T7oPk/m2XMb4zsXmOAcwGnkWPDKTdvg1ghHpep5dVFg=;
        b=UcyvJLvf1qiJ1V1CGa7O9n+pAjoBz6cLCivAvxHbLs/oheCa8XnnlZ65bPWavLd8fi
         wfDe6A+Pik4dqdumCZ2bJLsMH6aI0j8eF6y9/OOY5bc3yQ2pcI9174ncdXvq2lyvn9DV
         lEPh8Q1pAcRpsLLETNg10CQ8aBwz+l1arVHvHPTBaxxzE3Km1EoLCNSomqmrM72nle4g
         JABr0+wuygVU0SV4lVc3p/uKzfAx79ms8MIsnrqERkpCP8VrtoUdSQHMnnp1FreknwoV
         RCDT6V242gDVse8mRa5xwafW3qI/HtGkmApwBNv9YTT9dWwcwjrwVmmWmINAKpv26Sg1
         383g==
X-Gm-Message-State: AOJu0YwuLRp33lwG1c9zRDV/jlrt5jlEqCEifgxFRWwxU/4z5yPsQJGQ
	N0vvkxLxuxaoCZ+gTF0EaQA4BoXJDPpaJnInZxLM3NKjetQ4+CJpnkSoeKtftNWgzGPMXFw50T7
	EQ8rSs252OW6zea3i01nBqiiOc1K+b/x/vZ79
X-Google-Smtp-Source: AGHT+IGgZZN+o0s6DAvz10yvo6Z2yfjytPc/fZov8tMy/MAcCfeAieGw/k1jwKrbEbg01HpSnTMd7xY7cjHZurGxFX4=
X-Received: by 2002:a05:6512:e9d:b0:536:52ed:a23f with SMTP id
 2adb3069b0e04-539e540baffmr6810632e87.0.1729052117157; Tue, 15 Oct 2024
 21:15:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008082905.4005524-1-wenst@chromium.org> <87iktusfy0.fsf@trenco.lwn.net>
In-Reply-To: <87iktusfy0.fsf@trenco.lwn.net>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 16 Oct 2024 12:15:05 +0800
Message-ID: <CAGXv+5FrwPcYWR-XYEjeUPLCttjcwbVgD++T6PBXsW-xwiGOOA@mail.gmail.com>
Subject: Re: [PATCH] scripts/kernel-doc: Do not track section counter across
 processed files
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 2:22=E2=80=AFAM Jonathan Corbet <corbet@lwn.net> wr=
ote:
>
> Chen-Yu Tsai <wenst@chromium.org> writes:
>
> > The section counter tracks how many sections of kernel-doc were added.
> > The only real use of the counter value is to check if anything was
> > actually supposed to be output and give a warning is nothing is
> > available.
> >
> > The current logic of remembering the initial value and then resetting
> > the value then when processing each file means that if a file has the
> > same number of sections as the previously processed one, a warning is
> > incorrectly given.
> >
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Found this while improving and checking the kernel docs for the
> > regulator core.
> >
> >  scripts/kernel-doc | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> > index 2791f8195203..c608820f0bf5 100755
> > --- a/scripts/kernel-doc
> > +++ b/scripts/kernel-doc
> > @@ -2322,7 +2322,6 @@ sub process_inline($$) {
> >
> >  sub process_file($) {
> >      my $file;
> > -    my $initial_section_counter =3D $section_counter;
> >      my ($orig_file) =3D @_;
> >
> >      $file =3D map_filename($orig_file);
> > @@ -2360,8 +2359,7 @@ sub process_file($) {
> >      }
> >
> >      # Make sure we got something interesting.
> > -    if ($initial_section_counter =3D=3D $section_counter && $
> > -        output_mode ne "none") {
> > +    if (!$section_counter && $output_mode ne "none") {
> >          if ($output_selection =3D=3D OUTPUT_INCLUDE) {
> >              emit_warning("${file}:1", "'$_' not found\n")
> >                  for keys %function_table;
>
> So I am curious, have you actually seen a spurious warning from this?  A
> normal build does not emit any here.

Yes indeed. I was cleaning up some kernel doc sections for the regulator
core and running both files through the tool together. At some point I
was getting the warning and not getting any output from the second
input file.

> The current logic is indeed screwy, I'll apply this fix.  But
> $section_counter kind of seems like a holdover from the docbook days and
> maybe isn't needed at all anymore?

I've lost most of the context around this, but AFAIK if we don't care
about not having anything to output and can drop the warning, then
$section_counter could be dropped together.


ChenYu

> Thanks,
>
> jon
