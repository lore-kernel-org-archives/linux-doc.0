Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B9F2BD015
	for <linux-doc@vger.kernel.org>; Mon,  8 Dec 2025 20:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765226161; cv=none; b=ILXaVhAer1/jTyXO1BzRc0+LI6HYWeDpnXwiqpfsVBGqDEMrWt/4e78LSAOfgeeUp15+9dZmOftmlganGdIpS0rcbpR4DI2JLKV6Wamu8+vUdyOSP+a30HKr7PR5RbB33U5yg8N0FyTnx0ks7xXSn9IleiFGqcY1zXpkmOK8Jxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765226161; c=relaxed/simple;
	bh=/rKlc0claZ+O+eRC8htCK0yG2YQIyD6b/xLiuB6zLqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AsNCl7dtNpm+d9N0FB+3JbMFQFa2+gQ1Aauz3kTe0UhxDCvbnC8KFm4xXmwLIoALmNbR/hL7ArIMtPGEZuqRE8298A3vLfZ7gJHaDCUhVkHfgqHHrDopE5I3zwGveJgFh3j/ZUPdOmb1Z+1RzPSvcA8lyphujfcFmIo/iOcsZp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DLf97ukF; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DLf97ukF"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59583505988so6021338e87.1
        for <linux-doc@vger.kernel.org>; Mon, 08 Dec 2025 12:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765226158; x=1765830958; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3D5kD500HpmwSprzmfQML5Kvc15a25K3Hzfpzmghy+0=;
        b=DLf97ukFW/DgKdOnIgs5DgcN22gDa/hiwmGYkJZu+Q2j6vyxQuAYVQv+EQgkxZcQIL
         7Nth0mIweq1cz73ERfa9RymQur6PeNpqO1/2B9TDU34Ho2FSQw3Zj4sCo3UK+4SoEWvy
         TK3m3LIZcKpUdyV5CvPH5tJG92sbvuRmcwGdn92iq77La/QhHBMr/2DzEaG/4qDJJ2cc
         jAiTQoEdRxkVuQ0sKXYYlSI+qHz8mKp8ngG1NDjqRspQGzENj0lIE+sEsEA8QqiK4Sl4
         /uMeg1wlwfwdkGxiSbFhXwvP4eEHM/kaaelRywDWGIB2L2vK83Bqsmf829DS0xP+lX0b
         OnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765226158; x=1765830958;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3D5kD500HpmwSprzmfQML5Kvc15a25K3Hzfpzmghy+0=;
        b=VYmxC0rr1eg4zm5igBqsT0khqOjv2uRvBTgqXU2tSt/UaRu8m2Uk1tPFeZUknQDUZ7
         8G2AgJcrMa05tYRKp++AkHXRuzOSp/3TQ75A15Fxr4GojUAwAQKS5ugOMh97uS0Fe8Uc
         nprOm4uoLV4Z9tCU9wSt8zVtsAOH1+s62aT5wD482J8dBI0djlAfODnEvVO3nkS9u3NG
         ReOpm4QgdYrhht/+gSXJbmranp/y+ltdumaEwiWbMIb+hCImZdqYteECAFUfr21ceH8u
         sYLXoMEz7vJsDXgTQ3C04/5mqgvO1r6g9DwPx59u742dXYt0rm/bQ8QP5APVEIWB3a3n
         CZZw==
X-Forwarded-Encrypted: i=1; AJvYcCVtfxEQMqlZhpv9X82TIHy3BbqMJU94SKhzCD+ZVVz6kfhNAU+a9NEKc0MsdONjiRsj1A/OZ4ljmGE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvmR+SeiQlFjZ7XYbZXLGqd2mQQ7fJ5lAYau2Lh9ukREwKY8NO
	s6Pk+wwHQBUvtWovS/cqNfVatNoVc1dCnNKt6Rbg2mLGgyRgGHY5ZGY+
X-Gm-Gg: ASbGncu6z/IGF4GK5bvIOrY4CxVcmNc5df5oQw9BfiCaVSRtntfmBFXcHa2gOfQ1SRf
	VzzJJ8bhiaTeJcCCaDVBNu8GckQ1x1EYxVGe6mPH8iXnfUnngueuj3u5vDgDhz/JqpMqg6Hu73A
	O43x52FxQYHn0xTFQ/dPMiFbBsbn6/CpImiRpyr0NljKWi4902efCoGhiDrPxfdMfzdu7tVdJO6
	C+81xt2NSDPmETROoWgp7CCil1qLIM5wstRPi5FSl6ugo9Z6C/vbyFq0XruBCSU2cdUr5Mr9P2/
	TXIiXLsZcw2dL4Zl9NfqczhHULbXbQxEaQQJ8aD0GDn90uIF8oio2KZSwhqDeaBcoKsKBIWDZ4O
	NGKQyDGY5z59mh3jkdm58tNAnlfNeBAQIt8TBJ1ckjL40uvUtVqTlg1DWwKm940BWCHacsfZucy
	UVaA==
X-Google-Smtp-Source: AGHT+IFxD46idyml5mDZecUPUQulSu8KqgMNNDpyRDJrIw18BS9ui+72Y8Bk2CtnjeAWlIFclHhKVw==
X-Received: by 2002:ac2:51d5:0:b0:595:90ce:df8e with SMTP id 2adb3069b0e04-598e92ac83fmr187477e87.5.1765226157327;
        Mon, 08 Dec 2025 12:35:57 -0800 (PST)
Received: from curiosity ([5.188.167.4])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b1a7dbsm4400878e87.20.2025.12.08.12.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 12:35:56 -0800 (PST)
Date: Mon, 8 Dec 2025 23:35:53 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Andy Chiu <andybnac@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: hwprobe: expose vector register length in bytes
Message-ID: <aTc2qaf6JxBPLvtH@curiosity>
References: <20251121193524.1813200-1-geomatsi@gmail.com>
 <CAFTtA3NVd8HMomd60i=T_S34TSL18==aYRFhg2AH-PbsM=hggw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFTtA3NVd8HMomd60i=T_S34TSL18==aYRFhg2AH-PbsM=hggw@mail.gmail.com>

Hi Andy

On Wed, Dec 03, 2025 at 11:57:06AM -0600, Andy Chiu wrote:
> Hi Sergey,
> 
> On Fri, Nov 21, 2025 at 1:37 PM Sergey Matyukevich <geomatsi@gmail.com> wrote:
> >
> > The vector register length can be obtained from the read-only CSR vlenb.
> > However reading this CSR may be undesirable in some cases. XTheadVector
> > extension is one example: existing implementations may not provide this
> > register. On such platforms, vlenb is specified as device-tree property.
> 
> I wonder why a hwprobe entry is needed even in this context. If vlenb
> is not available, we can always use a vsetvli and read the destination
> register to infer register length. Isn't that also true for Vector
> 0.7, or are you considering anything else?

Sure, reading vsetvli works for XTheadVector as well. The primary reason
for the new hwprobe key is convenience. Vector 1.0 and XTheadVector have
some differences that complicate that sort of autodetection. For instance,
an older encoding for vsetvli. Good examples are vstate save and restore
functions in `arch/riscv/include/asm/vector.h`. Using hwprobe seems more
convenient than using vector-or-xtheadvector logic with custom opcods,
especially since the kernel already has all the necessary information.

> > Reading vlenb also initializes the application’s vector context, even
> > though the application may decide not to use the vector extension based
> > on the reported length.
> >
> > Meanwhile the kernel already determines vlenb at boot, either from the
> > CSR or from the device tree. So add RISCV_HWPROBE_KEY_VECTOR_REG_LENGTH
> > to expose the vector register length already known to the kernel.
> >
> > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> > ---
> >  Documentation/arch/riscv/hwprobe.rst  | 3 +++
> >  arch/riscv/include/asm/hwprobe.h      | 2 +-
> >  arch/riscv/include/uapi/asm/hwprobe.h | 1 +
> >  arch/riscv/kernel/sys_hwprobe.c       | 6 ++++++
> >  4 files changed, 11 insertions(+), 1 deletion(-)

[snip]...

> Thanks,
> Andy

Regards,
Sergey
