Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F83B288C20
	for <linux-doc@vger.kernel.org>; Mon,  2 Feb 2026 17:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770052110; cv=pass; b=IZV6r0OaRUW47DmQxCuGkEvW/onkCVwarS50VMtmHuQ2t+pOlSbIdSpsRYKN11wAkF9AxBjouEJBV658TMQ4cOUFEczOcq6fbTXx8ov+yYcLnCJ4cnxEFQPgXhUHbvqPIFzlDCFLjdSe9r3/D6FFz/A7nyXg2x8PEa/hV86nHgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770052110; c=relaxed/simple;
	bh=3Bc35rrd/1nEUpNbTp/rtmqmuILxiEv8mLWZG3M1pGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ek7l+Xaxmy1cleoIYgc2T5W6e5Hb6pwt2BqDX4Y27WmU6psKew2YwiVHgDhEh9dpf69dz1mTRVMsVIGABwSZxcvahwmESHxCs39VHeL/3PxKb4Mj9p8+S2IO1MkxV8t5Gb4qHMac3gOZg54jVaCn1W6kSLjKfHqPgEKvIt3Oxn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aKh1pPZz; arc=pass smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aKh1pPZz"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6611cab8ca3so2944123eaf.3
        for <linux-doc@vger.kernel.org>; Mon, 02 Feb 2026 09:08:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770052108; cv=none;
        d=google.com; s=arc-20240605;
        b=BNqp+kQn63QgdSnpUGxMpOQrBlQqoSeO2e+INwqpqlyiZXreO1BzlVLT6VrvzlW8HP
         g7hu1MQ7HcLF9YnvqaqrixbG8n24coqxnA6uyzJZUqjRmwPWEbd9eHBXN1MkDZf4pNtt
         OOqEWoZzHllCGPdPVg3CYAHBDYKrOxILnGIHZbyVUBBqat1a8OCL4wRFkgqvl6OjY2Y1
         nB+ndaS6fZTsz0hJMO+SZ5R5J18nYMHU1938e302gqtXeMQf8KqlHdH7i8Hct6/i80bL
         eVFRWT02xLyEySnB2W7Qbo7SihtESaQwzcyjGWhmtsaV1cwpwR5WU+LYXKOzTu9vgEPW
         6PPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Brp2DIv12z/rO4sk6onXiqMCAEqHY5eu/69R5/C1L5M=;
        fh=CvAoNJxu24rG0D2SJaE2994iI9FE2xtVN6/18KyIvjo=;
        b=fF+6ilCCTULyLnzvTtkImU4sz/dRTALYZ2iXKQbHwCOx3oIK4rtlIIQ8ok2xyRgK3P
         OWwX7rE6skC49fdZKGNjRu2cG78qIKPNeIJ18OsOEZbX0ClabdmMW5Aec8zegMXbioNd
         6T2QlWVgR6SegOKP2+bUl+s8y8fGCDiCFnbVb/uSTSBg/TFz86bEEKuWdlOochmeBheL
         t48MhnhnxzEANSO+Bfy0MOzBFlfR0fAQNVVpCBlBUBi+uwD5cYKQ4I5LKjRldSlEkQ8h
         P3J9nL9oktmJy6hb2eFqFWmJSYIBwfcr/ykCiUN/8odm1ET6CARo03Sdam37InqL4abB
         VLtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770052108; x=1770656908; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Brp2DIv12z/rO4sk6onXiqMCAEqHY5eu/69R5/C1L5M=;
        b=aKh1pPZzEPyzxjD/0eMifL211PpbkXp6KyOiY10k30cr8gfBPzrIGAmC5VjkC8Xva9
         uNfvqDKB2fOhCI/h4HPXA7bBIadnsGKLHnnE9q69TyIviirs6JLDjCAMybbX+jv82Ukn
         xv6CJ0HeCDQc7ryRiYalmOgfCnK/T4dm/AXo5kEnYs9DQHJ2NB6qa+F4iqPxNKhD+aVM
         V2aa1utMNgHjH7Z6B5bXPnehdTflr4ZGpwVG+/f2rBJsZlG4gi7O+IEkT519iCxTMaZV
         /YweehNQkWxdCG/7c3tNVdrvtPgyqgG+Qa5Kwn0Xiv5swy8K3BZqzBcn0ZgxjzVdFf4I
         xGOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770052108; x=1770656908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Brp2DIv12z/rO4sk6onXiqMCAEqHY5eu/69R5/C1L5M=;
        b=Y/tpB0aGTSL90pKiGHDinroElO5Z27qFnah3yDCkYMok+h8E97nA3Dn0+t77EORDga
         KSP7UcKjejMQ+QiTg0h3U2/4jFPvUHttTfeD6ZUvCNwkWH+BycDzKkHAP+Uv4204vdts
         CGbNh4cQUZFqBmwYAF3rJf1zV7poUirynrFMPtkQSdj1dZXQOKMDnzgBmh0lY8df3uCH
         nmit8mwUn/G4m6scDl8IwptZ9/YbGc3CaBS6YlJiByYkBFiIo+WGhUJOvVa2RCTu+DgJ
         rfkKCRUNLXnkrbjezC39PVLUuhG28jNFVvYw+kpJpH14+D5uuGiGWSR4Cqcsl0FXf3+3
         /YWQ==
X-Gm-Message-State: AOJu0YwKyAstNdjYWWtDs8O2liOOvP9CA8CxU0YU9n6eaf2IO7qxv67I
	R8biqJ86wMjOfGuRzV6pYXkWrZzvOYgzBnIuOAIltVPx4SGK5brxyjrNv4rD5d/ikUw0nUPDxcC
	9eyPfmqUlC6hCFpBVVyI2VLvDPw6AkYDnDonmtVc=
X-Gm-Gg: AZuq6aK8mKww4ttB75oE1c//wMwzEnydaq4/BFIDgjSzZXAEA8J1GJ5YM42RF7bIHCE
	/jTPh2JbdLokBULlKmRMCePVYesGd/yiwFIhTOUBHWrouYscOd7wMCD6f/mawukubz5pLcKkFZr
	iW6Jw3LDXIg54aUGqN7aPw4Co57mW6t9ZN2N1phS0T7WHwyAWKArWemly/QMGpUuOtOzVbwWtXy
	iDR/XOciToRRJTlpd6ojvMU6heN6SMXZB3PSRmbUpeT1tWCuJs7v2AEBGTMk3FGA3N1gilfsDDf
	dppQwKkDFamaCPjl/1UtGHoUJv4=
X-Received: by 2002:a05:6820:2228:b0:663:8c2:feed with SMTP id
 006d021491bc7-6630f3d4c04mr5803202eaf.83.1770052107650; Mon, 02 Feb 2026
 09:08:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMAsx6dzNMHYA630UWtD5EJX5QqyT9BqJX03c5QzHN9EizjQtQ@mail.gmail.com>
 <87a4xrta7s.fsf@trenco.lwn.net>
In-Reply-To: <87a4xrta7s.fsf@trenco.lwn.net>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 2 Feb 2026 14:08:16 -0300
X-Gm-Features: AZwV_Qg5oLeTOGFXxJ08jWU62oRtMcTO3UHvA808FwW10rGA1iabPl6f08nRMoc
Message-ID: <CAMAsx6ehJD2b+2TFgqJ4VjE2=hfi4uW5j41A-MXg5YuBrbZ1AQ@mail.gmail.com>
Subject: Re: [QUERY] Guidelines for starting pt_BR documentation translations
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Jonathan,

Thank you very much for your detailed response and the guidance. It's
great to know we can move forward!

I'd like to inform you that while I was waiting, I also translated the
submitting-patches.rst file. I held off on sending it because I was
waiting for your reply to ensure the initial procedure was correct.

I am also pleased to share that I have a community of about 200
students (I am a Linux instructor and systems engineer) who are
willing to collaborate and maintain the pt_BR translation tree. This
reinforces our commitment to ensuring the documentation remains
up-to-date.

My current question is regarding your observation about the merge
window: Since I have already sent the first file (howto.rst), and with
submitting-patches.rst ready, should I send the patch with the
submitting-patches.rst translation now, or should I wait until the
merge window is over, as you mentioned?

Thank you again for your assistance.

Thanks,

Daniel

On Mon, Feb 2, 2026 at 12:51=E2=80=AFPM Jonathan Corbet <corbet@lwn.net> wr=
ote:
>
> Daniel Pereira <danielmaraboo@gmail.com> writes:
>
> [Responding to the public post rather than the private email]
>
> > My name is Daniel and I am a Linux instructor and systems engineer
> > from Brazil. I've noticed that the Linux Kernel documentation
> > currently lacks a pt_BR (Brazilian Portuguese) translation directory.
>
> That is true; nobody has shown interest (until now) in creating or
> maintaining such a thing.
>
> I have become a little leery of translation efforts; they tend to be
> started with a lot of enthusiasm.  But keeping documentation up to date
> is a real treadmill of a job, and that enthusiasm tends to fade over
> time, especially if it's a single-person effort.
>
> Nonetheless, if you want to make a try at it, we can certainly accept
> it.
>
> > I have started translating the 'howto.rst' file and I intend to
> > maintain the pt_BR translation tree. However, before submitting any
> > patches, I would like to ask for guidance on the proper procedure:
> >
> > 1. Should I first submit a patch creating the
> > Documentation/translations/pt_BR directory along with the first
> > translated file?
>
> It seems you have already done that :)  That is a good first step.  Your
> timing is not ideal, though, in that the merge window starts in a week.
> I'll not be able to accept a new translation until the merge window
> ends.
>
> > 2. Is there a specific coordinator for Portuguese translations I
> > should reach out to, or should I send patches directly to the
> > documentation maintainers?
>
> The coordinator for Portuguese translations, I think, will be you...
> yes, send patches to me, please.
>
> > 3. Regarding the MAINTAINERS file, should I include myself as the
> > maintainer for this new section in the same patch as the translation?
>
> Yes, or as a separate patch in the series.
>
> Thanks,
>
> jon
