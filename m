Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D667149C72
	for <linux-doc@vger.kernel.org>; Tue, 21 May 2024 21:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716326036; cv=none; b=pwXPSmxRNlLklVRb1UKJE4MeTjOxVs5O2vKJt/2EzmUWPj+fHrMDdu0MePMe7oUpR4MRMJ6o1hWTSQ8/7rVN/5q9jwwJchBwxbprSEkOVQBTALkoveXXTCEK4XBIdwSEbftiabq80Q7D0ZmkhJ9Zzbs+vQqZg5yUNwjbiObwhKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716326036; c=relaxed/simple;
	bh=i37TKc1fQUsg/MZXbDEDex5DUJTdLQ3Tj3BGogak9pA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=smNxZs7mInPl5GXtNKBXwQ7xV308ubDLtCjZMsu+JZrEFQFml0797e+KeTQ2qmR1dMVaKyAg0d29rSRKV9Lv8Ueb3FfVxdAUxc2Co79BbX+OwLtzmh2kAUbGOOc7s7kamq4idQZvKO0T1JfzMGSRKJOieGcDUwvYUXlS22nWakQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=R+Zf/95d; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="R+Zf/95d"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6f44a2d1e3dso857691b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 21 May 2024 14:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716326034; x=1716930834; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FC4kUSh55rUz/GL+Wk6zz4yqmj0fvdXDk4Dif5NdqwE=;
        b=R+Zf/95dvP/0V0V+6tbrf9QgnWZKSdL0zWW00M1xhJUCrAiZ/JRddcXYBMNpmScwmk
         2kvJJlsFiaCT5Kwc10OuNPQk+BsJaO0UJL9bbrOUgR5sxxBlVnLRDMNA/6fPVyRzghqM
         QGltPOZ+jv8MXvuF8lFcojHP9tM4LfvuVuqDgroKetesuzwUrr54VtUS7NY2ToVLehn/
         tC43p+hzleHKaNA+OstEPPrfCcH939lEg7e+vJkMYNnNyn7pqJAB4MrNCOMjUqo4Hy9S
         9zEXNqX5SSHhqeWPNgp6Dk2rCgKMLc9N217sDFuPNhm05dp9FXquGjpt+O18PO/71PL3
         Rx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716326034; x=1716930834;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FC4kUSh55rUz/GL+Wk6zz4yqmj0fvdXDk4Dif5NdqwE=;
        b=YiijxqkGYkGwdjYIynK0ZEbBikTIwU+hZ2iqlxEmlYkscSGTY1yPXA/cNqhZM5lOW7
         7c+01+bkleUjZ6k9yisLDUcthslQw3dPzTByo6WlAicZbcP6JzthDS/vr9x7C6Pz21bZ
         Ub0LJDWHxOThy7Z+NIddWt51bgKQkIz7FseGhRF1GOX+H77uyyf8A/NeP6d2mBbP8vxr
         snW4YiNy3CstW16ScEGYBkbhfAXSHSxAgUGZR0vYIRSAuxY/cP9YxYoFNHMgk117GLNT
         +VJ0KSCEXX5vTZC8RUVE1xR5Qtt5FG2DpuCa4YHQha+aQDrvsx6WpK/g6REbKyMwX+kj
         U2Aw==
X-Forwarded-Encrypted: i=1; AJvYcCXdNE0B88M1z1Gqr3FVftvSFvq/C1LBjdWg5D13mghngs3NyT2Q5Wr1NVuh/rZYozuey/5/ht6i6a8ptrz9PKfQeohiWsymIHYJ
X-Gm-Message-State: AOJu0YzYKnT64fO5z3N7q9cCh253mPghrnWbnlTfRu1bt5Rlh3fdHODO
	qDNR7j1NEV/+oclmCjrdXlAeejBB1tp9OBO7AILhVlXX1XXXiMTQciIC4BCz4UQ=
X-Google-Smtp-Source: AGHT+IExOxw4dQLOtq/6oMwBUTDL+aZgZxi9IpFxyzL92tIt1l3Fojcg/3lRIxum789QUlv64lDgPg==
X-Received: by 2002:a05:6a20:a10e:b0:1b0:1a02:4131 with SMTP id adf61e73a8af0-1b1f87f815dmr257815637.2.1716326034285;
        Tue, 21 May 2024 14:13:54 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2b254cfsm21167196b3a.200.2024.05.21.14.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 14:13:53 -0700 (PDT)
Date: Tue, 21 May 2024 14:13:50 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Evan Green <evan@rivosinc.com>
Cc: Yangyu Chen <cyy@cyyself.name>, linux-riscv@lists.infradead.org,
	Elliott Hughes <enh@google.com>, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] docs: riscv: hwprobe: Clarify misaligned keys are
 values not bitmasks
Message-ID: <Zk0OjpW1nizPXHe+@ghost>
References: <tencent_9D721BDDF88C04DBB5151D57711D62524209@qq.com>
 <tencent_338DF690631BAE788C4CC858233E9FBAE006@qq.com>
 <CALs-HssGcNso6vTfbcsiWX1h_46jgDDRcEWcfZCTpxXYnubcng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALs-HssGcNso6vTfbcsiWX1h_46jgDDRcEWcfZCTpxXYnubcng@mail.gmail.com>

On Tue, May 21, 2024 at 11:36:06AM -0700, Evan Green wrote:
> On Sat, May 18, 2024 at 9:00 AM Yangyu Chen <cyy@cyyself.name> wrote:
> >
> > The original documentation says hwprobe keys are bitmasks, but actually,
> > they are values. This patch clarifies this to avoid confusion.
> >
> > Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> 
> Hm, we also have this problem in the code, since
> hwprobe_key_is_bitmask() returns true for KEY_CPUPERF_0. This results
> in wrong information being returned for queries using the WHICH_CPU
> flag. If usermode asked for the set of CPUs that was specifically SLOW
> or EMULATED, the returned cpuset would also include cpus that were
> FAST. I believe all other queries are okay.
> 
> The one-liner fix is to just not return true for that key in
> hwprobe_key_is_bitmask(). But that's technically user-visible: if some
> software relied on the buggy behavior of FAST cpus being swept up in
> the query for SLOW or EMULATED cpus, this change would expose that.
> The grownups-eat-their-vegetables thing to do would be to define a new
> key that returns this same value, but doesn't return true in
> hwprobe_key_is_bitmask(). What do people think?

I agree. A new key seems like the best option, keeping the old key for
backward compatibility. However, perhaps instead of the new key
returning the same value but not returning true in
hwprobe_key_is_bitmask() it could instead be a correct bitmask so people
would be able to have the feature of or-ing together the keys.

- Charlie

> 
> -Evan
> 
> > ---
> >  Documentation/arch/riscv/hwprobe.rst | 31 ++++++++++++++++------------
> >  1 file changed, 18 insertions(+), 13 deletions(-)
> >
> > diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> > index 239be63f5089..4abfa3f9fe44 100644
> > --- a/Documentation/arch/riscv/hwprobe.rst
> > +++ b/Documentation/arch/riscv/hwprobe.rst
> > @@ -188,25 +188,30 @@ The following keys are defined:
> >         manual starting from commit 95cf1f9 ("Add changes requested by Ved
> >         during signoff")
> >
> > -* :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
> > +* :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A value that contains performance
> >    information about the selected set of processors.
> >
> > -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNKNOWN`: The performance of misaligned
> > -    scalar accesses is unknown.
> > +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_MASK`: The bitmask of the misaligned
> > +    access performance field in the value of key `RISCV_HWPROBE_KEY_CPUPERF_0`.
> >
> > -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_EMULATED`: Misaligned scalar accesses are
> > -    emulated via software, either in or below the kernel.  These accesses are
> > -    always extremely slow.
> > +    The following values (not bitmasks) in this field are defined:
> >
> > -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SLOW`: Misaligned scalar accesses are
> > -    slower than equivalent byte accesses.  Misaligned accesses may be supported
> > -    directly in hardware, or trapped and emulated by software.
> > +    * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNKNOWN`: The performance of misaligned
> > +      scalar accesses is unknown.
> >
> > -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_FAST`: Misaligned scalar accesses are
> > -    faster than equivalent byte accesses.
> > +    * :c:macro:`RISCV_HWPROBE_MISALIGNED_EMULATED`: Misaligned scalar accesses are
> > +      emulated via software, either in or below the kernel.  These accesses are
> > +      always extremely slow.
> >
> > -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNSUPPORTED`: Misaligned scalar accesses
> > -    are not supported at all and will generate a misaligned address fault.
> > +    * :c:macro:`RISCV_HWPROBE_MISALIGNED_SLOW`: Misaligned scalar accesses are
> > +      slower than equivalent byte accesses.  Misaligned accesses may be supported
> > +      directly in hardware, or trapped and emulated by software.
> > +
> > +    * :c:macro:`RISCV_HWPROBE_MISALIGNED_FAST`: Misaligned scalar accesses are
> > +      faster than equivalent byte accesses.
> > +
> > +    * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNSUPPORTED`: Misaligned scalar accesses
> > +      are not supported at all and will generate a misaligned address fault.
> >
> >  * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
> >    represents the size of the Zicboz block in bytes.
> > --
> > 2.43.0
> >
