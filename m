Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9731AF4F9
	for <linux-doc@vger.kernel.org>; Wed, 21 Aug 2024 14:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724249800; cv=none; b=gJc/WCWbDs1rSrDAdRfZksfCMhAx0BJ4xAA2yh6W3SzgSDWtAsGlHBNmSForibWZPKFBjzCIJ+5ZhR8SCSzQe1BzMGMd41enuZneWDxl13ps7Xwm3CyKHrd1UxXgF2j1cimAwpMidM/wfKGUXJtCsrYyfQj9aa9bhXcy7K6YG2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724249800; c=relaxed/simple;
	bh=m7X/1nlXFnx6K0tldZgYVRy28K5m8NEXV6Gf8fcZUY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DjV7hB3I/7fgAmYH4YWlEZhjljWRuNWhQpi5xX+BPYXAIVulI/cwYUVnG0ntUQ5j+I2q4UfPXwvMTEQbXMbbmhw2K30sNjUwQ88B8T8MmdgReqG+L06TkOlVzcwhTQz/LkBcRJGPVoqMfv6kuUnM3NkNStjSwqTQnV555/8XOLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Tsz5XWcb; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Tsz5XWcb"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5bede548f7cso5065139a12.2
        for <linux-doc@vger.kernel.org>; Wed, 21 Aug 2024 07:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1724249796; x=1724854596; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1HTAcUTpqyzByMJpquHWMYu3B5Ynm1G8WC9iJphytM0=;
        b=Tsz5XWcb8kgJD1Ws3tSxzX6hvOqRgnl0Luq6pCR1RPHYgN69yatPpGv8p9etiTsvMA
         GiNsdmm6cS1NBaK0dSgbfZLGAyvnuoBaY/RNWHfspXBByG0z5cFJHEafk0SopjUh6BYk
         icyt/geF9FtpJuqjUvkiS93lUwb4WuS7MTvDZgGVERaUDApLy9Qk4kLAEGj/u3vjN+7E
         HP/mEUf50F/kmkpW5EAbxsqZTCS/w+lhhoEb0HPOBk94nWk6BDg0Nn9YHSOJFmZ0XLzF
         unPBY6Mm8gMzsAbxZ6MsVaWw3inLyCC0ZFVmEabQBPRYrgpuMWQl4xrZHEKbiy2bTsMo
         7fKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724249796; x=1724854596;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1HTAcUTpqyzByMJpquHWMYu3B5Ynm1G8WC9iJphytM0=;
        b=BDCQxWFAqGvc4bGU2fsZIdHJ1TX7nX6LuJ7c8GJHYug3Cl6X7bae/tBAF45hnTtZY6
         NbnFP8xMSxJ6VnKp8lgTpimyKVykmpTYiOrkIJ0eBKXWmPFr1fFH0Nr/6RLtuFaH4lO5
         DbQHriwqK1ClurBra+O5ED5RjzfhHQ4SzLT74U1faH3SraluWOB8PKyh9cSy+MfaZ5S5
         gXHtRxQWCnTfCdtQp/tuuzXaq7c5doBvK2QRGiUEVAUMKFwRKZPWHm7k5dvrvqNPOHTx
         ClbhmIwOAJSZMcT8ULGhfr3wGHAohXDivafHLjtB5olp4DgNo34YB50jArSq2sny1kkk
         BUGw==
X-Forwarded-Encrypted: i=1; AJvYcCU97fBSnUObbIcZfci6k3FTtNy91wg79BL+1VsTm30pCBjwv4RFRAtVTmgVhMn6kpuCbJFLX28pbkQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxR52VlmjxfE1pnaITEcz5F/oe7owak1X4XsZ7L10lEZXIxEJc/
	PMZtUcnDByZl7UZ/qq6WDkdT1s3Q2YhqPT78jj7LEXCxOivTvC/fO6BYlMAAYZ0=
X-Google-Smtp-Source: AGHT+IE8bwm0dEjF7VBywYff/AafpoSdjerliMDujGbpLZiuwqH+igjndWkqozC0Ufc6S5g43YyWNA==
X-Received: by 2002:a17:907:9803:b0:a80:f79a:eb6f with SMTP id a640c23a62f3a-a866f11b8ecmr177010066b.8.1724249795649;
        Wed, 21 Aug 2024 07:16:35 -0700 (PDT)
Received: from localhost (cst2-173-13.cust.vodafone.cz. [31.30.173.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86680ed15fsm136535866b.224.2024.08.21.07.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 07:16:35 -0700 (PDT)
Date: Wed, 21 Aug 2024 16:16:34 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 04/13] dt-bindings: riscv: Add Zabha ISA extension
 description
Message-ID: <20240821-5c19951bb4f35f7ed90fc10a@orel>
References: <20240818063538.6651-1-alexghiti@rivosinc.com>
 <20240818063538.6651-5-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240818063538.6651-5-alexghiti@rivosinc.com>

On Sun, Aug 18, 2024 at 08:35:29AM GMT, Alexandre Ghiti wrote:
> Add description for the Zabha ISA extension which was ratified in April
> 2024.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index a06dbc6b4928..a63578b95c4a 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -171,6 +171,12 @@ properties:
>              memory types as ratified in the 20191213 version of the privileged
>              ISA specification.
>  
> +        - const: zabha
> +          description: |
> +            The Zabha extension for Byte and Halfword Atomic Memory Operations
> +            as ratified at commit 49f49c842ff9 ("Update to Rafified state") of

The typo is verbatim from the commit, so

"Reviewfified-by:", err...

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

> +            riscv-zabha.
> +
>          - const: zacas
>            description: |
>              The Zacas extension for Atomic Compare-and-Swap (CAS) instructions
> -- 
> 2.39.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
