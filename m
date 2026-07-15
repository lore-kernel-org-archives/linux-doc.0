Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102483B47C6
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 17:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784137374; cv=pass; b=gLbcPMXOCfhNAyOT4lz/dJrHcuEEd7cRv/MLbikIWn/lfI5aT+ASZaIP9cwSc8u80RPBX9NNK8W/nirLWXnqJEMKkRJbdb3QPHTOCmPPPuD0xGpesoPNj2Lk/xpyFr7hKblLSIgIN8umRLCnIUMxmGsi+jcmUORVLMOi4ZSttKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784137374; c=relaxed/simple;
	bh=lqPWPLsd1mdm14PaCsJU17LDyYujbuXuFrVYwqaG7X0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pvsjB4ukVF6NZFDKzdR4PQBSQVBpvPlsdeNGFhRkCRNGLHakuLLi7KFfH/QMSbbV+DimuD/G41nRisHy//he6XlNI0fCFzH045ly4tzWLORZ+hpQ8U72JmKPcUX4FfLvLOcESvUeJiB/I0IdXnmBwrzag7Rj+0rzajjhzACtqp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sb0UMLQZ; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sb0UMLQZ"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-69c20ba892eso1306579a12.1
        for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 10:42:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784137371; cv=none;
        d=google.com; s=arc-20260327;
        b=XUpGN5ZWhmC2YFEkJH/BbclpgE/jwwyApQOTL9zndnheSdBYhG0ueptyiQ/8xKbr8+
         yNRYYxpP5obRcSC0frvWMqOGbDlLVP6U571NAWtcfu2lJKLF+5dz8SPb44hJCetRX5qP
         AcFwU9gfS29Y4r9zPLKAwPLRU9SGYQsuifFrqUPOfKkWe5C4TK5w/Bn8qWtzuIyCF7ed
         VO/v4pAuHA+BU+Y5ewqWNgPOX/UWj7EOumQQGjfxTHTwgILdniDBPnwC2faEPAifDUbc
         t7kR9QMNOocJzGsfI/rW0VvitY1kNp0pKUjaidUqRc22qz+3qfV5IKfyY8QrqkTLFh11
         /PiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9LFKN/kjx68uZioMl5T89OykCMholjMJrJP61G9DYd8=;
        fh=dADrOZulktm2dpGs58sk0606RpJFEDcMQcxknKH9t4M=;
        b=gX4jiTtQWCNeDKtRN0ROh4Bl/Lnz6L/d6jXbhBgDr2lcLrqrrwt7fTNG4Ny3/m8n9I
         EzceL9y9oDRae1hlKICBZNnoMf6srITJzE66/ingrmxum4/6DJLjjsAW6WTKbBFqsDkJ
         9J+1cRgFsnxKYsysYl7lOKxi/xkxzBBLLEMrxlymYMD8kg1TRfbOY4Ln9g4EtyxoqVhb
         XoJXDK3pp1xrb/nibLKbbIUGY9rwKDNAzLq65whgIkul00AYFVKxGhD/lIPR6MkhdKo9
         TNZZnFkRtfRs4hSEo+v1lAC0xwbGHyhXDDX5yglYSFZRHTN4FFF5I9FBc7GE8l0BhXCX
         gR6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784137371; x=1784742171; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9LFKN/kjx68uZioMl5T89OykCMholjMJrJP61G9DYd8=;
        b=Sb0UMLQZ21ZN/zSDGB1k5d2Z1oL22TFywLNHX6GQVCOSR4ZUtE2Cx5IpcLMkedKonL
         XvJjWZ39AZsh4k0dw5u6jH1gmRIuwzV6lwjTqtJpuJcP23ukevjRtJ2/h/dvIM4r3zfC
         6TxwfunfWuylytNpE0cB/li8a0f5s7vNaHf8jcZxdjBoO+MhUIQL8jjxRviZt1Zyi9hL
         FLd5kLYAScTO376ac+WK6xu8Wo3X+QkgdH5VWCEvJrdEyb3Ir3R6U1Ga7oCcKWK0x/gE
         QN+AqzyGMcO9OxvKIlW9s86/jZxjQcKO0NvZ5AAd4eOq3JJqMSh+8o7Lfswt/H2a2LcJ
         qnmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784137371; x=1784742171;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9LFKN/kjx68uZioMl5T89OykCMholjMJrJP61G9DYd8=;
        b=jlSEH4swpOHo5bSUG2l+pLujFAYeRkfeYzkW6GFaezez9e0OhpBaHo6po5E6jdw3yT
         MY/ruzxAc+AhlhAlkw0LC1AhT+pvwAellfn2mU915hsY0CCIw7S7zR2LXD8eNfhkdIfI
         TMrQ7qjanxt5kr6DQqcjlmzm2X/TymIjldPCueezyAvkWgONeXuwBKw5bemSk2K85Lpb
         AVDtM6Nb9XiZN9Vto9/6Fe7HrMI7DBHr2PGs+bCNGenY7XkVsu23WTfmOeQSR/d5kl+s
         8iGIko6MDMz3PKV88mRe23OwZVSMYuLE82uSmRv1GGB1eCPS3k7qu0UFuRnYQITRIbWq
         jw9A==
X-Forwarded-Encrypted: i=1; AHgh+RroNLTZzdGEggxN5XC8kaFGXMhEgz6sSC4E0QU7voEVR6eAtvpvBFrvlJa+y2bpG/w2AoFEmiVKkLg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+zf7rYgdh5rNzNTUl0bNEWvHnrYZ0OsRJJsAVmquz+fFtDrC6
	qJ8pHeJe0uAT8RBbpADQT2D5dZR8Kgr1uV9SGESGbcH7Ln2UQhW9DcpgkX0lm62fIKoWQ4wQ1mT
	kRGwPmNTyQ36mcWYAxZUcPzyiYO9ch0Q=
X-Gm-Gg: AfdE7ckzQXYhNw6OmCJutgN7DFsLh5rmLY/mier1a/gIlzq/nyvMg9Ni91vyz7nkgxt
	KgocPiW6SLPcil6nwDYXkJxZUrbAnVdCua52YJoxGu90tvIrkJ5ycvGT3OKSfbcC6AQikeeegQE
	H6I0MZ/4aG5gRxwQP4FjHghcuq2hapgJfRZ+QoJTxc2+ZfbPugmHLUtacDGvWvGkS1ziHterXyu
	w7PEvsPeUmpy8vNgqAcnF+bpINMNfoikE1hYy/ius2rnVPcvRgnQlEhNJSlH+0QpBm5+GBIoQ==
X-Received: by 2002:a17:906:fe09:b0:c15:ee17:47a with SMTP id
 a640c23a62f3a-c168bbd4eb8mr30571266b.15.1784137371242; Wed, 15 Jul 2026
 10:42:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715-overlayfs-rst-update-v1-1-70625a67880e@teledyne.com>
In-Reply-To: <20260715-overlayfs-rst-update-v1-1-70625a67880e@teledyne.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 15 Jul 2026 19:42:39 +0200
X-Gm-Features: AUfX_myzE1qF4pubFIocl1cyp7nOMYj37ZTPuHMSySiwLYiGApfpQ44mJvgMhMg
Message-ID: <CAOQ4uxjkPev8ZE-KVPczMysvy18PUYSQ9yM_K2K=iygmioYA1A@mail.gmail.com>
Subject: Re: [PATCH] overlayfs.rst: remove mention of workdir needing to be empty
To: jesse.vangavere@teledyne.com
Cc: Miklos Szeredi <miklos@szeredi.hu>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-unionfs@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 3:52=E2=80=AFPM Jesse Van Gavere via B4 Relay
<devnull+jesse.vangavere.teledyne.com@kernel.org> wrote:
>
> From: Jesse Van Gavere <jesse.vangavere@teledyne.com>
>
> This requirement has not been true since v4.8 when automatic cleanup was
> added in commit eea2fb4851e9 ("ovl: proper cleanup of workdir")
>
> Signed-off-by: Jesse Van Gavere <jesse.vangavere@teledyne.com>
> ---
>  Documentation/filesystems/overlayfs.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/filesystems/overlayfs.rst b/Documentation/file=
systems/overlayfs.rst
> index eb846518e6ac..7e28bfb4a99e 100644
> --- a/Documentation/filesystems/overlayfs.rst
> +++ b/Documentation/filesystems/overlayfs.rst
> @@ -123,8 +123,8 @@ At mount time, the two directories given as mount opt=
ions "lowerdir" and
>    mount -t overlay overlay -olowerdir=3D/lower,upperdir=3D/upper,\
>    workdir=3D/work /merged
>
> -The "workdir" needs to be an empty directory on the same filesystem
> -as upperdir.
> +The "workdir" will be cleaned up at mount time and needs to be on the sa=
me
> +filesystem as upperdir.

That's not accurate.
workdir/work is removed
workdir/index is not

but I don't want to get into those nuances here.

Better just drop the wrong "needs t be empty" part


Thanks,
Amir.

>
>  Then whenever a lookup is requested in such a merged directory, the
>  lookup is performed in each actual directory and the combined result
>
> ---
> base-commit: 58717b2a1365d06c8c64b72aa948541b53fe31eb
> change-id: 20260715-overlayfs-rst-update-750d58792f79
>
> Best regards,
> --
> Jesse Van Gavere <jesse.vangavere@teledyne.com>
>
>
