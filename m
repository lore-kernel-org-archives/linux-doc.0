Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013593D965
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 17:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="jRZhIpRL"
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFABB44AA
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 10:28:51 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c5028e5b88so81783821fa.3
        for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 10:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697650130; x=1698254930; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XlxzenAtGOBBl5FAqiPH6k/I934Jd+ferEyJouIx4OM=;
        b=jRZhIpRLvHx99GWRzosWKHGQA31uO+NHuBTXGM9WDScHZA7wl94szidBj3Qo1JDcAU
         eWmU2ktDFVEbc7mC9J89bTay2mSkl9XYrk1EhglM0gDycQn7dHOKECNlUb35W9Ju9bqJ
         DQhAoU8ZF2R83e4z0LPKTmACqRTB/vYcRVvoxAClPkbA5N5LCD5ZLi0qid5lY1QQ6eMC
         gX75gtTppq9iz9RoAGNw9KUMFDn2bNhjtBJ0nmdSuTXUrgPKWnHpRHzWrAlmVthk8KFU
         BavzRf0mwFWkq8QwnZyfGQzdXevjkfoxdIShIoN0hnU+ExhBBkQ3jjUwmW/S8r29wXKC
         vb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697650130; x=1698254930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XlxzenAtGOBBl5FAqiPH6k/I934Jd+ferEyJouIx4OM=;
        b=WAQvmudTBOoRYYBuMHFqPtujE6Rx3owXpl1+mC0ooTdzAfFww4hHN2m4VwXjpLk2tq
         cBRj1jKegvrOC8KNxic3CIHRMZvmU/l4qKH/SUjBeml9DyuLNGs/Aw2GgxMH/MBSXx51
         n1R5h0dGEf4bA5rQ8hUZtO17SGfMDnxavv6WR2TLGGUG+sSYrcOomHVFutXwmyKT9CmK
         ChwbhN1oTDT7W0brpxvNHR9l2cFaakR2WidxdbUnNxNYpLUx3lIhg8tMrmzDwL7RvLm1
         8NaJCv0qbnv7fpTLfXksUOYqMKwGKliAIItKZ/woH6TRMhqqsDQUckblj1f6ZlmG9fFl
         aKLQ==
X-Gm-Message-State: AOJu0Yzf72C0dEEMdc7lHHLolcfk/NZRlHDpMulLPMpDQ3g567o6HQjU
	ls0nY4L7Z1vhfZprPB/wUJ7ZzdWVJPkQF4KQLLj7BA==
X-Google-Smtp-Source: AGHT+IGHruj4vIi0kef+bVD+gPV4FxwyxPA0I1qw/x4/ZVHhtOHwosRH5M2N+IuPXDxc9LdApCvF7N2Iujro1xmxL7A=
X-Received: by 2002:a2e:9107:0:b0:2c5:1c9d:7f81 with SMTP id
 m7-20020a2e9107000000b002c51c9d7f81mr4392793ljg.32.1697650129601; Wed, 18 Oct
 2023 10:28:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231017131456.2053396-1-cleger@rivosinc.com> <20231017131456.2053396-10-cleger@rivosinc.com>
In-Reply-To: <20231017131456.2053396-10-cleger@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 18 Oct 2023 10:28:13 -0700
Message-ID: <CALs-Hsu4_sJ-qPXdg--p6+u9Zu_+FFZVAPp=D7SEuR-XG_A-nw@mail.gmail.com>
Subject: Re: [PATCH v2 09/19] riscv: hwprobe: export Zfh/Zfhmin ISA extensions
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Jones <ajones@ventanamicro.com>, 
	Conor Dooley <conor@kernel.org>, Samuel Ortiz <sameo@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Oct 17, 2023 at 6:15=E2=80=AFAM Cl=C3=A9ment L=C3=A9ger <cleger@riv=
osinc.com> wrote:
>
> Export Zfh/Zfhmin ISA extensions[1] through hwprobe only if FPU support
> is available.
>
> Link: https://drive.google.com/file/d/1z3tQQLm5ALsAD77PM0l0CHnapxWCeVzP/v=
iew [1]
> Signed-off-by: Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>

Reviewed-by: Evan Green <evan@rivosinc.com>
