Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B7926C3B0
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 13:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779800627; cv=none; b=TnGNmDiQGrnKomJ9KsQ32MTIgA/TobvyqhNSzE9urvR4xAI8j7Y1HPkKngkIcHSMPiP1KFNg0my1/+ZfToogTNnI3PX1sgYE4AjDtUPn24svVwHsrullmoNp5OX0mjscSXInT1IFYdaJq0jMflhlJ0Gy6N7tFnr0esbkjorGd0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779800627; c=relaxed/simple;
	bh=cIV7eVLFj1WSRdO8UJfWGAKcQ4RL3tgfGuH1jAdS3kQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dQ98z2ZrVRcm72qHJVkHiBVVFsvlV4SzolDX1ZWrNL/BzB1Y7FUGW8F145D9+xjf4xjCXIHbC/citovbTE/oorBh0rmlSi+rK+Q3NqBxwmVcVxXO5uSGvnsT9rXSdOP5m7+oPnmmiY5OurqoEva9nShaqwAnXreI6iq21h41jL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CkA/ew8b; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CkA/ew8b"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-44a5174670eso5942900f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 06:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779800624; x=1780405424; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UjNTcWc9bOGf723loCTUep8771/uj7ug5EPYZq+XxOs=;
        b=CkA/ew8bHQnTyLbheU0tKlrPxe8xDGNFqQotUJEMcWW3Tn4izx9/5Wr69fbvqXNIrH
         eJhcFYm2FwT43HFHVhup2TEWSY9btQCJdzdHC25FcRPDFu7X2XfkNGJQk6Y1iz5JxwKo
         QjRf5jvXL7ImDuU+nVFT6WEDEvaTgphh6DX+WVNxkUDEo6LVdU1oGl6Nwp1zelB8yVRj
         tqr3xqAOovFmzd70qP/wIIL6ed41pFKIxGQCy6wcvHaKBqF7L7MzEay+rWNRiDWepQU+
         +gjQOuGxUKKqxIyCOBXsupJUjswmD1ds9yBuhKnSOtgCrorIOlMa4DmTgbMDlNkJIqBL
         tWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779800624; x=1780405424;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UjNTcWc9bOGf723loCTUep8771/uj7ug5EPYZq+XxOs=;
        b=UcT0o+qq4hxsFaQHQmbyFelyIUbkOUEmv+BTHk7dzp0hqCqDazs8MdQt6pfzOpYOJb
         QW51U1xnvOZZoA8X4F8BWHG5zxGBdg6aS5X3Wk3wVHpBTpWB1tjzYGnu7qcubtKcO9WX
         EE4kn4U/T+TvXudT416FNa7LJogGFuUv55Dt3pd8QcWTRt2B/lltfVxavN1XR9KUG1OL
         PiaRmumc517K20Fo0eTI+g8bpRb4rLtOdhnadjCyubn3UkrSrK2DvsxQbTPkqB5vv9fq
         r6ifPQdCqZ0ZMfJOieHBnL+3TwSpqnQCIADOpag7SVNNPBcJEjC2MvOTuLUdwUnprZGG
         k4/w==
X-Forwarded-Encrypted: i=1; AFNElJ/Krd02KaUyFDGWN4354jg5ZKHukFXg8Bp57+Ddua+GM0raRRHU2zvPfSG5HvRNoaNmqPM71MLNoe8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6jOieJNR3BO9uHeARA3AOvN2cTzm8kRe5x9VtszG0ZFCPemGc
	a58paiy04iDcm0LZhBhLbKTK35PvkbWWZHh6pLAhqpM9XcbHPFKm0XAE5SZUAux+o3s=
X-Gm-Gg: Acq92OGFsuCcdEaGRro1IDbc3icLP+C0lSFtT+0v0mvtqD+4XZpjnHdScVvet39kDFG
	vhQhOvMvZHQfT+9hFtcKPrEdH53wUK/hyoVqON3oosuyF/a5sh0iswWpeSvCk7lkbox9tMVaJSu
	5KGDvvf3xasS8MlE6TNsdRSncRYFhoTVoHJvVQXFT/2U+iMYcz+6BnsmC1BntlcbwSYndlXL8ee
	2oV7I0kGxogiAooKL7+uk9ECSk7Tt+F21/IdS0SLlHw1rDQoySb7sK0wgq2/V18DETyOBTsEyBm
	eWFWIGWlzyFDJtJlRb03qf9C43EgsuMFxImN3RkLoLBuRFaHioOcMGb5QPspOsu/+YUKD+5gjQu
	ZrUL4EVorbaJH6eEY86AUaAJcwU2MNIa9DiUz8kfIw2FMDzt36lpTfJWKUe7iYHxu/TGhBxi9In
	iIwtfH2ldbBEHocguLVdhLbwEQBIYHApXKKKmlB1SSC7Wk
X-Received: by 2002:a05:600c:45ce:b0:490:52c0:73f1 with SMTP id 5b1f17b1804b1-49052c07823mr223327865e9.9.1779800622880;
        Tue, 26 May 2026 06:03:42 -0700 (PDT)
Received: from [192.168.42.79] (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904561a198sm318501285e9.10.2026.05.26.06.03.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 06:03:42 -0700 (PDT)
Message-ID: <635fed3c-4e39-4357-acd1-13f1653f9e3d@suse.com>
Date: Tue, 26 May 2026 15:03:39 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/14] module: Move signature type check out of
 mod_check_sig()
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Roberto Sassu <roberto.sassu@huawei.com>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Eric Snowberg <eric.snowberg@oracle.com>,
 Nicolas Schier <nicolas.schier@linux.dev>, Daniel Gomez
 <da.gomez@kernel.org>, Aaron Tomlin <atomlin@atomlin.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>,
 Xiu Jianfeng <xiujianfeng@huawei.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 bpf@vger.kernel.org, =?UTF-8?Q?Fabian_Gr=C3=BCnbichler?=
 <f.gruenbichler@proxmox.com>, Arnout Engelen <arnout@bzzt.net>,
 Mattia Rizzolo <mattia@mapreri.org>, kpcyrd <kpcyrd@archlinux.org>,
 Christian Heusel <christian@heusel.eu>, =?UTF-8?Q?C=C3=A2ju_Mihai-Drosi?=
 <mcaju95@gmail.com>, Eric Biggers <ebiggers@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org,
 debian-kernel@lists.debian.org
References: <20260505-module-hashes-v5-0-e174a5a49fce@weissschuh.net>
 <20260505-module-hashes-v5-9-e174a5a49fce@weissschuh.net>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260505-module-hashes-v5-9-e174a5a49fce@weissschuh.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/5/26 11:05 AM, Thomas Weißschuh wrote:
> Additional signature types are about to be added.
> As each caller of mod_check_sig() can have different support for these,
> move the type validation into the callers.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- Petr
