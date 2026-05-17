Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3C029A32D
	for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 09:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779010263; cv=pass; b=C4zlelroLYvqRJWETLVtKBTv8qG9WMFUPIFhPhQrHbLZZY/LAmW3IDALXG7wwQZhQSfvCnMf1z61ftwIyHPeihLeh2PcdTTZr9wq67TFa/hYdvR62QJ/WnxjZP2CvCnEp5oejvZdaZqfOq/9GmF3KnjxXvcIyXE1GBCykCdUFT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779010263; c=relaxed/simple;
	bh=Tj8PMwAalAJ+NmdWjfw4/5fdDmXngxe4fWcsgfJA14M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nyspe+C51fPZwXvFhGiPp5H6tt+uaZ87CBX82JqDlqLmrAKXdagZEzNZNfHWgEWChjaM/XpIwgnBs7txkx0nDaqZTjWXR2Jni0dFTJVjR5tXzFLdLGTeFwyox/Q6SWcNpSDcNzKIKqeyCU4+7mUPhSAat3asMOsIFlJtn3HDnXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCtUKLnb; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCtUKLnb"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12c7288cfb9so52032c88.2
        for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 02:31:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779010261; cv=none;
        d=google.com; s=arc-20240605;
        b=K91cNX6EpeM+4D58Yr6lhW1WUNK7zJKAZ/FQ3vl+j0b3VRTOKqMFeOpwTP+1qk7+om
         vjukepeI+T1ROwtEos4Y1Abq2bQjEs/Kj47PWvJWde6DHg2VI65MVRvhupBjPOShDuNV
         vuio8FD36dkIRrLPeC20jOMtdL2OEiFOCqXq/3ZkC9LBZYCsk1V1OUjPdgCVCvBwpQ8K
         EOkWuC63lINWjtnasy/XnXi2tavubYL5GikYw6UyJYbGxCAx3zyOT00nTg1odnUR13yB
         yap2g++pJ/u3r0Gvm380Ne7Bd+8rnQDPWdOj167tIlzwBxKqxI8GhT5Um5GQoRohFp0Y
         QVjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Tj8PMwAalAJ+NmdWjfw4/5fdDmXngxe4fWcsgfJA14M=;
        fh=Za/D6eT4rtkiWjyb8oKeWMAgRKwV3oVk0QU1z4hFJ4w=;
        b=JmcT2XimMpG3FxDKagoqD1zcqAmJXyG4T6d0SKZahlzS1JWH2Pz+6ksFWBuH567ILB
         +9eo9GK3NpxPEXL6kDdefv+YNR6D9u+CfNoFNkWbeXZlrdqxxDRZIKhxIsjLKAksu3UZ
         iXET5YYPAmKW73T2cT/skkmcU8es79ZAXncFKAkvHI8q1RfhdnmhluUY1CTxzvkHFJzG
         tG43mm8fe5po3QhNhekqVbcLVGjCTJbO6AFyGOkvE8cKXMufmB7GFnN5GDgfItkv/wws
         kPsJPhvyFjoPGhY1+K+NYz7OXpVtMpcrKM7nrwMUAB5EgCn3MDxlajQxApoBGU1Obo9X
         degg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779010261; x=1779615061; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tj8PMwAalAJ+NmdWjfw4/5fdDmXngxe4fWcsgfJA14M=;
        b=cCtUKLnbQwjHOBQmbvQgYF1WfDMRn9Y/5xHPQqn24MmyIJd593XJyCFQENtQL1IXbQ
         92xmA/PBzRKbaMzncdonmYc2jfJfAifZVN5jqMQcQsdIJNIHnqoo9fYmDPRWOB+5G8TF
         v+VSiuhW/mOXn5lXdKTWRThQt7T7tfKXQQgQcuqFbh3kdSJjCL6hw5N0mDdB98sheB/r
         yLhkUypmLWotpUn+Y/AlLUNP6/p/7s6oNj9L6zgWcREVrbhTV1nFpnvg+W4FkY0FpzbD
         mxiAUtIDqh71jm7I96kAbpSi8e9Msx6h2RaRyirRWOuR54PEXYWAVPl0UEx+7J2YLvgJ
         d2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779010261; x=1779615061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tj8PMwAalAJ+NmdWjfw4/5fdDmXngxe4fWcsgfJA14M=;
        b=EC4d5pRbP+tW6ZTr5YCSd9DI+gi08Dqkyer9mcYryu5c76mlSt/n8yvexyjNz/VZ+L
         Xl3wQ+6pEDnQTy5GNMpo5ATO2Hi54/Wfgaxly4Bu/uofFU6kQgd3VdbQUSEL+xQZp/k2
         fT0ufGqPLn/AHy+hJql4HaObR7DodXcp05N1p3c3K6lnG2hv12teaSSS5geOHWnNdwuZ
         55fF4yPlqp3xgIXIqNg6skoNi9jjuyxuYsOe8+d4CqohT/rn86d5k1/kY6HwPT5A6BVv
         HkX7of5OiBapQIO+z4s9U8cizhn/RYWneAkh9JqPyOmKdDSKCqgBL5QaUu4Em2+G1yxS
         GEww==
X-Forwarded-Encrypted: i=1; AFNElJ80KZDBxxnVWt0jo5xOe0+BHmAOBQJ5mEYlKdd4lyY6x6gCH9SETs6exibFvzZedM7QhhvDn/eGtWA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxCYB6EqcrHC7puuCMAh2LMSxKHNIdnIUiQps4Y8LDeDi41Pag
	4ibiUs/q70QZg1COSkJ47Tw665glhK9QjIH0JvwJ2x/rSEZp3Fu3VNioBkqnl/mNU09xEnISBG9
	XOR0NbL9wnJkSHBT4CV7meGxAi6kjhXc=
X-Gm-Gg: Acq92OFZQke0rF8J+Y8OXzIAhD6CGFM45FDeF4DP3ZC4XValPziSZt861EUS7/VBlJp
	jGYu7bVDYV8jZnILAaw/RbYMviiS1nWEf0ycxPmzRhqHD7YStTPHkItRRVx7dhncn2fTuaASlfb
	3c9D7wo/RNIrzqZztUVvwkxp5jzmubgA02BSokjBZE5zizdrkGExl5iv+g0VlPkyjJg6lDPb9i5
	sSMNWV8FoNjvz4xLvvF+bswgqGdZ5SBBhGpzw4k4/EsG3NvdWEn6DuHMiki6s04+lId5+i8Z/au
	UmEFopZGFYWBbL70PtCRBHqtJKS4ctG/kNejq3ZBiLh7ijsJGkczHqP+UM4cY0vlRM3JmlH+ZDK
	/rU//Sw5pPWNg1JUFbLYEkYxSDXs+f/M4rw==
X-Received: by 2002:a05:7300:c89:b0:2c6:7f49:a840 with SMTP id
 5a478bee46e88-303984e931cmr2228415eec.1.1779010261233; Sun, 17 May 2026
 02:31:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516215354.449807-1-julianbraha@gmail.com>
 <20260516215354.449807-2-julianbraha@gmail.com> <CANiq72kr=tzvEitYj6xyT=jGnKQZK1dmekSU3us7MWGTrv0FNA@mail.gmail.com>
 <615113d6-7e90-4d54-ad1f-a6833474e8c9@gmail.com>
In-Reply-To: <615113d6-7e90-4d54-ad1f-a6833474e8c9@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 17 May 2026 11:30:48 +0200
X-Gm-Features: AVHnY4LeUOW2UmbbdfLrnREDBNSldtrnck-nHpAbjlAYEl4rANYC3G7F97ZBSWA
Message-ID: <CANiq72=9nxRgfFf1WzWgp=TP9or=Mi=wLyME9-f2M4hti+ZNcg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/3] scripts: add kconfirm
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Julian Braha <julianbraha@gmail.com>, nathan@kernel.org, nsc@kernel.org, 
	jani.nikula@linux.intel.com, akpm@linux-foundation.org, gary@garyguo.net, 
	ljs@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, 
	masahiroy@kernel.org, ojeda@kernel.org, corbet@lwn.net, 
	qingfang.deng@linux.dev, yann.prono@telecomnancy.net, ej@inai.de, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 17, 2026 at 9:32=E2=80=AFAM Demi Marie Obenour
<demiobenour@gmail.com> wrote:
>
> Using a ton of vendored dependencies would make for unreviewable
> patches.

I am referring to `cargo vendor` here, not to copying in-tree -- we
already discussed that in previous versions.

Please note that I was arguing for avoiding actual vendoring in
previous versions...

> I'm the one who suggested using FFI here and for command-line parsing.
> The command-line interface would also work.

Yes, I suggested the CLI in v1, and then you mentioned the library in v2.

Cheers,
Miguel
