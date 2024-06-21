Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337651607BC
	for <linux-doc@vger.kernel.org>; Fri, 21 Jun 2024 18:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718992814; cv=none; b=KfZZ6yu6HxxkI8wVtTVZK5P7ISav9+fzM3P3/UOXbsvOPp0Y3MgQ6L9ruBv/D+pmAg8aQZn2HLVLq7GYfTV5zzXpyanj4D7I5tgjEHEwqVff8XI5DJqsdoSjodNtX3gZlZqgMJRpnjHg4QaUjEnS/wgUcSjJO+fcJqw3o9qNbOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718992814; c=relaxed/simple;
	bh=V4euiQgGx4pOlMV3eIVI7255pZV+a5w1+ggJ68bkuuY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=tg9xP6mJ+trZYZ4tRCO75psGmL9ggqVimcZRRydolGmiZl8DZcDemFs3mEYXXxbjv5GCTjjWGmSaB/urx5ybeIbTM3/g5fwWovR2v68YlwRbqZjNWBStaKxVtkLdDpW7yR2ntgLYLrrVgNaUycerq2a5goLxqcV4CGn3XMdNcok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jrtc27.com; spf=pass smtp.mailfrom=jrtc27.com; dkim=pass (2048-bit key) header.d=jrtc27.com header.i=@jrtc27.com header.b=iQVgpBg+; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jrtc27.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jrtc27.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jrtc27.com header.i=@jrtc27.com header.b="iQVgpBg+"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42179dafd6bso20616915e9.0
        for <linux-doc@vger.kernel.org>; Fri, 21 Jun 2024 11:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1718992810; x=1719597610; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dcW2S4JnM/18YUMxiJvbZaNnlkBv83HxD2e/gGhKLxA=;
        b=iQVgpBg+i9rFywdnUfMAtC/adt6637SVe8giSiZNjVaqwWMY+S761P/4OpXUy9uJ2P
         lyB2ACBdOAaKWzy2SqMsrZn/S/i0jBp/RXWLDh5pRGn9491dpvuxu3f3w2Za3ayY77yp
         KGbWCq4bLYlhofVioEvzH3f0rVrsXXia/5q39C4vrGKvTl8nUQXIGEzKrIBqjzXUQvG2
         4Mo8Lu0h3gm1hqyBhepixKootR+1B8Zr5r62nCvGnBS1hHrZ+XO5XTij3MRcQmioCNx7
         UTv9gF94+sFlWD+ZzRFdu2tpWSlDMWh0ZmTjILu2poHUhKZoJCyxPgPAZowDXHIR1M2A
         QmZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718992810; x=1719597610;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dcW2S4JnM/18YUMxiJvbZaNnlkBv83HxD2e/gGhKLxA=;
        b=rRcScKA3AqryyBcqsuuczHt/6LRGll4epzWrH2GdPeAU8KWU13MKI097WfOKLe4VKS
         xwFsFfsKf1kvq5d0bIp/s75gbubcwVlZblxuHDFZWv/UHmfEqRibbn+XgxnPxUyRVYaZ
         6JWsKvY3GRnVcxs1R5BFAGXAq1tuQuMmZSAKZxwgrZGwEov280kScdZBsr+0XmKoZ095
         bNzsA2cIKNGHkFJ9YdCYShz5HLN1eLhN4djKr0r8wh0sfsbh3/O5BH+TNB2g33q7Tg9B
         2CpYPIyDe1/D51QtOuwscUQm1WC/+ARwyGW9KSwmGxP1Ma4FSc1GomlRA/AAE0UQNMGW
         8h2g==
X-Forwarded-Encrypted: i=1; AJvYcCWitH1INBZWJE/kL/jNqpw8S82T5da09EEElrp489huFVRWcVsbouEqEM/0RnnmE435xfDse+hl7QAMkBTClttc/wcPmkJZ2lA6
X-Gm-Message-State: AOJu0YzfLr3VSOW2wDXQz1RdBCU8ej6PvBEATsKcnF0hYxWHW6VdrG+1
	i8JkUeHNVNMa62ctb3Nw3SAyZwdU186R98OS83tiEOZRyvseRiZT6eR71BVnTcQ=
X-Google-Smtp-Source: AGHT+IHJZWd1LTX+rQA6S+wz85uWg7nnYgT+DKEAOy8tWyIz+TJ8SRQ7NPvaMSgBbS6QqFs2pP71fA==
X-Received: by 2002:a05:600c:1d28:b0:421:5a2a:3cca with SMTP id 5b1f17b1804b1-4248630f4a7mr4623265e9.10.1718992810372;
        Fri, 21 Jun 2024 11:00:10 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4248179d59asm40748835e9.9.2024.06.21.11.00.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jun 2024 11:00:09 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH v2] RISC-V: Provide the frequency of time CSR via hwprobe
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20240621113143.35827-1-cuiyunhui@bytedance.com>
Date: Fri, 21 Jun 2024 18:59:59 +0100
Cc: Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Evan Green <evan@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 costa.shul@redhat.com,
 Andy Chiu <andy.chiu@sifive.com>,
 samitolvanen@google.com,
 linux-doc@vger.kernel.org,
 linux-riscv <linux-riscv@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <705FA6B0-53E6-4CF0-B840-D51EC871B596@jrtc27.com>
References: <20240621113143.35827-1-cuiyunhui@bytedance.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
X-Mailer: Apple Mail (2.3774.600.62)

On 21 Jun 2024, at 12:31, Yunhui Cui <cuiyunhui@bytedance.com> wrote:
>=20
> From: Palmer Dabbelt <palmer@rivosinc.com>
>=20
> A handful of user-visible behavior is based on the frequency of the
> time CSR.
>=20
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
> Documentation/arch/riscv/hwprobe.rst  | 2 ++
> arch/riscv/include/asm/hwprobe.h      | 2 +-
> arch/riscv/include/uapi/asm/hwprobe.h | 1 +
> arch/riscv/kernel/sys_hwprobe.c       | 5 +++++
> 4 files changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/arch/riscv/hwprobe.rst =
b/Documentation/arch/riscv/hwprobe.rst
> index fc015b452ebf..c07f159d8906 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -229,3 +229,5 @@ The following keys are defined:
>=20
> * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int =
which
>   represents the size of the Zicboz block in bytes.
> +
> +* :c:macro:`RISCV_HWPROBE_KEY_TIME_CSR_FREQ`: Frequency (in Hz) of =
`mtime`.

This still says mtime.

Jess

> diff --git a/arch/riscv/include/asm/hwprobe.h =
b/arch/riscv/include/asm/hwprobe.h
> index 630507dff5ea..150a9877b0af 100644
> --- a/arch/riscv/include/asm/hwprobe.h
> +++ b/arch/riscv/include/asm/hwprobe.h
> @@ -8,7 +8,7 @@
>=20
> #include <uapi/asm/hwprobe.h>
>=20
> -#define RISCV_HWPROBE_MAX_KEY 6
> +#define RISCV_HWPROBE_MAX_KEY 7
>=20
> static inline bool riscv_hwprobe_key_is_valid(__s64 key)
> {
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h =
b/arch/riscv/include/uapi/asm/hwprobe.h
> index 7b95fadbea2a..18754341ff14 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -73,6 +73,7 @@ struct riscv_hwprobe {
> #define RISCV_HWPROBE_MISALIGNED_UNSUPPORTED (4 << 0)
> #define RISCV_HWPROBE_MISALIGNED_MASK (7 << 0)
> #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE 6
> +#define RISCV_HWPROBE_KEY_TIME_CSR_FREQ 7
> /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>=20
> /* Flags */
> diff --git a/arch/riscv/kernel/sys_hwprobe.c =
b/arch/riscv/kernel/sys_hwprobe.c
> index 83fcc939df67..fc3b40fb9def 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -8,6 +8,7 @@
> #include <asm/cacheflush.h>
> #include <asm/cpufeature.h>
> #include <asm/hwprobe.h>
> +#include <asm/delay.h>
> #include <asm/sbi.h>
> #include <asm/switch_to.h>
> #include <asm/uaccess.h>
> @@ -226,6 +227,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe =
*pair,
> pair->value =3D riscv_cboz_block_size;
> break;
>=20
> + case RISCV_HWPROBE_KEY_TIME_CSR_FREQ:
> + pair->value =3D riscv_timebase;
> + break;
> +
> /*
> * For forward compatibility, unknown keys don't fail the whole
> * call, but get their element key set to -1 and value set to 0
> --=20
> 2.20.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

