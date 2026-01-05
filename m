Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF07280331
	for <linux-doc@vger.kernel.org>; Mon,  5 Jan 2026 21:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767649627; cv=none; b=NLrjf9OGkFghkKQY45SEjQGXrwbCFlFB9HUQYn9VXAwD2a112Zh7APVmSIUOaKAsNLfH0H4nq2Dpk7VKAVVego+zb9+5pXFHkzlf8nha7bUWx3numplvdhx+x0yNCzl/MWdcKNglqujhA6LQCyvxA2ehyDGm4eh8iI16zrNAOJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767649627; c=relaxed/simple;
	bh=J+Gx8dgtaDaOCa6guNpPMY4R9ECDi2V64ShI87ufFus=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XjlHqBJryFDzypsUJN5wk7+CiRKHf9kKkeWuO9pZUjSMtZ7VYYffP4IZSDBOQv/3MnRLyWvgfqGYK1fvHR7J5p31jIX0CwaKXLYgEZnHC048v3LaCTExSUL+U/PaSlUueYFraEbyMzpKef3AahOcjqQQdMiDkN82YLos2O7jvyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Difh1j+h; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Difh1j+h"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-34e90f7b49cso366918a91.3
        for <linux-doc@vger.kernel.org>; Mon, 05 Jan 2026 13:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767649625; x=1768254425; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WwkCXav2lczyWDa/90IeBviOn6NPSdWRMqM4EGa+avA=;
        b=Difh1j+hNxXGKqQxJXElgvMuPqQv3qnkKjOS85lnvjXICqsaZ/R34aT8Bcl5UMe1o7
         lHwyyMbs8dlWYpfBK1hWSF2IbUCUzGrudkWJxvWvyhOk6E+aIK9OpdWjxTErhlAXJLcZ
         Euoy4yKlXwhEsQ0heQ43PXuocPgHq/oX9codLw2sdiAx02gzUzxLqM9equXCZuXI3Qhn
         G0jujBzkBNF5FbSOitMrSWRtSvOIFHfYRHDOWdhQ00kXmgGmB92ZWhGze4pvxQRHMbrP
         5ZS95qP2sCIMVecJquK0mtB/XXlegrCZ26cSOJt5KkNEYbQrpvrmxoksqIBJdw9WCE95
         ap4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767649625; x=1768254425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WwkCXav2lczyWDa/90IeBviOn6NPSdWRMqM4EGa+avA=;
        b=RhmvoPYXcRXP3Bg6OnqbqJtRUWsx9yzXjbaLby28dErHpRLtqxXPUos26r3Dlhmqd8
         B5T4oKHcKAQn5QG99+ABUBVyJqhClBjfE6Ze9XTI9UCp9ErJh5tiAA1Kn2HuHFdeDvVE
         cJV7F+ZUAEB8cCbfdUZcQetwUDj3SBJrt7drEh/CYwyJ7wHJIDcIIUiWNhwvyLW4WB0E
         n9zkgWF4TLUfyWSTWTpy73SmHJM6RYsotQG9eeiWTRtMcRPcnd2BYWASBsdv12V1Noco
         TEFfrencFfV/ufg99jeIYmRXIGiQb4OHhJ5xbOEwhV+loR6D9rX6SOkRrxLX+FZ+UEQX
         3X9g==
X-Forwarded-Encrypted: i=1; AJvYcCVIJYijRIEdS3Bly/wlo4iAU11y6PJGbu6iA4NY+8MxJli/xIFOXDRky4Sc5vtzoSLXMhIZVyLoSfM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFXUeI+rwq/BW2eMdncq78O+15IE1KFq68KlEcQdYoQW/Vhj50
	2gYEM6hkUUYB3Vi701mkO5pMZkwDC6dEERgfv3fV1VLtjLLJhBH2ROP7Rjzi7jLPkWbyOWh/H5v
	/XrvmmjikCWzvPiVAOIB8NX+27t+hKz8=
X-Gm-Gg: AY/fxX6KvfJLVjV6DR5C4PTIGkQZREtx+gclNeN4R4IvhCHboUMEEiPdmGJ0bWC34/c
	H+s4eOjkPmsTGw4uiFPhseszgydRlTp5YE3h9nRLC+bIT1AiBPZETvDe45Xzib25qn1tSjvSMVu
	HW8UbbKHPbv6TWYWo29O9dEp0MPouLsiazX9z9cTnNifz5GuzQTRzMI70FUSngm3DeYou4huqXi
	2O9gn35UqnfLJa1mL5toytwblFq3vqLO/86HRMOmZeYmmqYNGBFZzFb/Dn8hwUiyVPhi7UjQS1s
	IXxIkMmeBDI=
X-Google-Smtp-Source: AGHT+IHsskLu6HnKJdCCfXRJdE7dXLxBMAMj79azBauWYy3y6qQ3J7D6JlF5OiEerlW37K0ga4xf0s9bT32jAA+wvnI=
X-Received: by 2002:a17:90b:544c:b0:341:8491:472a with SMTP id
 98e67ed59e1d1-34f5f26c758mr528365a91.4.1767649624619; Mon, 05 Jan 2026
 13:47:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1767352415-24862-1-git-send-email-vmalla@linux.microsoft.com>
 <bcd23277-a18e-4bb5-ba76-3416c84511c2@linux.dev> <aVjdUjai0lzpMeHv@archie.me>
In-Reply-To: <aVjdUjai0lzpMeHv@archie.me>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 5 Jan 2026 13:46:52 -0800
X-Gm-Features: AQt7F2p-hEWDJqeLM8oY0I9oCnUiBMu-ImRzQ0ri_zW4rBWOvpDbcXaAz_Mk23Q
Message-ID: <CAEf4BzbAKGJsWov1udk+f5jS-qKSLMY+j76FP-JuWuxjhc0h-A@mail.gmail.com>
Subject: Re: [PATCH bpf-next] bpf, docs: Update pahole to 1.28 for selftests
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Ihor Solodrai <ihor.solodrai@linux.dev>, Hemanth Malla <vmalla@linux.microsoft.com>, 
	bpf@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	haoluo@google.com, jolsa@kernel.org, vmalla@microsoft.com, corbet@lwn.net, 
	Alan Maguire <alan.maguire@oracle.com>, dwarves <dwarves@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 3, 2026 at 1:11=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.com>=
 wrote:
>
> On Fri, Jan 02, 2026 at 07:33:50AM -0800, Ihor Solodrai wrote:
> > On 1/2/26 3:13 AM, Hemanth Malla wrote:
> > > diff --git a/Documentation/bpf/bpf_devel_QA.rst b/Documentation/bpf/b=
pf_devel_QA.rst
> > > index 0acb4c9b8d90..3a147b6c780e 100644
> > > --- a/Documentation/bpf/bpf_devel_QA.rst
> > > +++ b/Documentation/bpf/bpf_devel_QA.rst
> > > @@ -482,7 +482,7 @@ under test should match the config file fragment =
in
> > >  tools/testing/selftests/bpf as closely as possible.
> > >
> > >  Finally to ensure support for latest BPF Type Format features -
> > > -discussed in Documentation/bpf/btf.rst - pahole version 1.16
> > > +discussed in Documentation/bpf/btf.rst - pahole version 1.28
> >
> > Hi Hemanth, thanks for the patch.
> >
> > Acked-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> >
> > 1.28 is needed for --distilled_base [1], which is only a requirement
> > for tests using modules. Many other tests are likely to work with
> > older versions, but the minimum for the kernel build is 1.22 now [2].
> >
> > Not sure if it's worth it to add this nuance to the QA doc, although
> > in general we should recommend people running the selftests to use the
> > latest pahole release. Maybe add a comment?
>
> I guess minimum pahole version can be added to
> Documentation/process/changes.rst.

pahole 1.22 is already specified in Documentation/process/changes.rst

>
> Thanks.
>
> --
> An old man doll... just what I always wanted! - Clara
