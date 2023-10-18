Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC353F4AD
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 17:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="LC2W0kv3"
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 786093250
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 10:29:36 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c53c5f7aaaso29678461fa.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 10:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697650174; x=1698254974; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9DTiAxqcwOSstlD5TGw90ppzIalLYVarQh5g8chQIFI=;
        b=LC2W0kv3He9ixkVdJahVxqyepw4kQo1nQlU+Dz37sccX2pykoqE3pklbdSjAXoPHqQ
         4c97Uv776iSsICQ9RufuReQ6FXNleI0z7U5LP4cF7CcyWKIRoTBYP64wUA9RDMmygqN/
         rptId2uWXWBkPHxRgqgvhUaObAWutngijx46cvMj2kqi2YhACc5BMvq/TbN8uWQaa5F/
         3GuGRsYogFIQy/sxJyIHf2Oy23zb25k/3OoNE8qlKhR/vP8PzTK0PCV3RHfvfWgLvhOl
         OiVUx6SDmZYo27+1yPwB74JS13gkbS8yQstqbIu0faDSTJJ3pRuRrPNljaMVZ7HJBVwE
         4Apw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697650174; x=1698254974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9DTiAxqcwOSstlD5TGw90ppzIalLYVarQh5g8chQIFI=;
        b=Hhx2T6KILpBymY+wkF++wTu5pUJVEh46wNC/o+WAzPDpI9WhqS1oUH4DmEp/ZablYF
         L/C8P61isrFODZdRHMXftFziIbPqyBpKWe7GTE9FLHr7gRdcXbPBntEFRrskQEgRDEjR
         8i/papfUlrRzwzvwcRmpA0oGpt97LzqVuRrM2ywIGKru0B78xs+JRVlvawVQ8kU7XxR8
         B61tOdQ5Z1pHB/ip18NaElYQlr8YeVlxfyvoYFjq4DeJ5N/7iFTOTxAveTQpLBq7L2mL
         SpgxILvdfLCy8F/3G/wkDL0YMe11jqetfU99tDiRONjp9wQoEQOVt126C0nL8SPxF9e9
         /h4A==
X-Gm-Message-State: AOJu0YxAHjRv04A+A/oS3v44hwO2BsoBB6JCeUFw1nvd9+e+taLrIUTw
	JD1QwjvlOIFBwVZaP0dh65P0Q4MgAwaWGfJacF1Plg==
X-Google-Smtp-Source: AGHT+IGSl/5M58lXn2uBdcMT7VrLiD0NX9sllCftagoL7/hlmkByal0UjqyOgJPJ8Ej/Z6HotqR68XE40MStcyvyXu8=
X-Received: by 2002:a2e:be03:0:b0:2c4:feef:84d with SMTP id
 z3-20020a2ebe03000000b002c4feef084dmr5219935ljq.43.1697650174385; Wed, 18 Oct
 2023 10:29:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231017131456.2053396-1-cleger@rivosinc.com> <20231017131456.2053396-19-cleger@rivosinc.com>
In-Reply-To: <20231017131456.2053396-19-cleger@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 18 Oct 2023 10:28:58 -0700
Message-ID: <CALs-HsufTbyShzXmUoczRJikjaHJ5se3Yfcp=fNAGydibZw4Aw@mail.gmail.com>
Subject: Re: [PATCH v2 18/19] riscv: hwprobe: export Zfa ISA extension
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
	DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Oct 17, 2023 at 6:15=E2=80=AFAM Cl=C3=A9ment L=C3=A9ger <cleger@riv=
osinc.com> wrote:
>
> Export Zfa ISA extension[1] through hwprobe.
>
> Link: https://drive.google.com/file/d/1VT6QIggpb59-8QRV266dEE4T8FZTxGq4/v=
iew [1]
> Signed-off-by: Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>

Reviewed-by: Evan Green <evan@rivosinc.com>
