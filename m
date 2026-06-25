Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A303DB33C
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 12:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782390687; cv=none; b=c0onGaGKVEBLGk6w4LM703tkQ7L1XLpm9FpMjvVe/3yu1FnTmWotccGWVSXMnHoSsv4QMnC4uQjjgR3tTGiJrdwnWyAN6Q/Wq8Sm5x9LuFN0b1/MZQprGFSMqd1R16POCpxQLyQDWYzciz6GYNytpFp8tC2hGFkkgIPMgSY+qn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782390687; c=relaxed/simple;
	bh=Oit0TcphEo5M+bMP77TWtYW3k4a7F2pKJuE4t0E9+0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bbkjvtcuEuZt6CmLgRPTdIBO1py5BKknt+BMB2kEM60YcGqCNOMCFWiA7fZTpZW5zLOI9ASvLKKp8tonXXHRPlpFdRyHKXf8xF4YqOOJC1nZcLCTilZ5rYrgFnHJRMyUXT2xU8peWrRGA795OmGjmGwknkL+9XApbVYh4TAKgpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gUzLEjyY; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gUzLEjyY"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4624c1409c9so1823569f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 05:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782390684; x=1782995484; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b1vSJuU58s7WyIhPZgYamD1ZPuUhi34Xe2P8nm5CBMI=;
        b=gUzLEjyYAcjnxVmA3Cfs5tMvMZb+nzUwzlBRrPBgpfBWOkcIKiQejRsbz5cmmkqEpT
         LEj8SBO4zOo+Oy63AI3fFHQlhUVVcXMXS4WtynSDigDc79aA+ohJbtikHfTD+COp1+Ad
         w201qJx3g80NyrvZ3NefeKCfqr4UE74OXZsG1Y8kTD275BL4Uie5EmHUcnoTa8eD+i4S
         jfZRIUtkUM1lw6PVn1+gEuH/v1wmL3ti49PUqROoFz7F/WQSYtPgfbP+Ft2eRf73IJ8Y
         ax5Rfz54S47tblNqoAvEhgtNfGEgTbLr9onpHgs7Wgo5OicQJKK2w91cepe5LAeblk0h
         202w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782390684; x=1782995484;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b1vSJuU58s7WyIhPZgYamD1ZPuUhi34Xe2P8nm5CBMI=;
        b=p0b4kQbRjwyaLwDbpJ6M6/EY4mNUEstLtIiSV68Avqe3GRcBtxlfOYIH214kIo1KVZ
         Y8bEFLHxyk/5hBkN7Ic/Q/O1U16YQ78dGfGgJ5n/R0Am3lWMCO22AubqRDEk9AyfpawR
         fwLVlKBCj3QVGlQgR6Vk1Q0oxhNDUcuMppWWzi6TRSgouX6OuXxXvd9ecy24j1zsg3GR
         DmDYcwwuH+VCw1Dprfq1MWWjLsgZ7jVBeZvmuo7THQLtbc70tBaXIOcAzoNgVHUgKp00
         KTgSyMYmyUsxhNEWScOCVquw8LrkLh8UJv7aOo8j5uTRL2NaOdbx/SIcwztBYUiGIqT2
         qMmQ==
X-Forwarded-Encrypted: i=1; AHgh+RqqUm0PvFu/OU7OpXkMN4PN1WisVEN2ugtngCK8rh2cplTv0jzpG79ohkh6GOLpaiSwGc4C/ZXTVYE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPNm6R9ypGNx+kbaGdHKRoJjv2Hl7g5B4JUdiFdrMHNJZlo2nv
	YJzemzSfWRqdSO0pYJDi885iZWAWCrtJOJyi19/fb/aJNfYpdJpheOBu8Y3zkhR7MQ==
X-Gm-Gg: AfdE7clEl0tr7Cfkl4fcwLY7XFDuPiKeyJs8AP9o5dVC9p7K5OISOKERUvUnXl3o70n
	mUc1y7vaXHSvwEtWYHFvnQX5C0MTb1p3xcWqiDIV/+5wpV09ZIS3Qy+3aiVZX/z9P94umTqhVpe
	WVNg8VaW9H6YDnwji+l0w8mqlMfKfw2cyGFEFFWuUHVMncPNRKHqrJLElOlRngwokiRQL+bHeBH
	FQt5Di68V+WaJg37HcE2is/NBV0cnNm0IXuleGJBSiIWOHL9PxdcaEYST5xQvUDpfRuYR+raN0F
	AlRfg53LjaHQ9z7rw59TLjC6Gtp7NThU4L1O+geD0w3TI7zmOKjj1DYHVxgWeSCs36XrQN4nroV
	ROmwZnx+CoO21t7bgIGSpS+lEse27gmu6MLbGZtY+v3JwFeAHBKfQnkzi6kuenPj2iysncv3DNG
	0Tqhx31pwFmxv9vlWdd0Mex9y9ukvpS4PWJOrTKk1aK4A=
X-Received: by 2002:a05:6000:24c8:b0:468:f382:b7af with SMTP id ffacd0b85a97d-46dbbecf652mr3506082f8f.0.1782390683630;
        Thu, 25 Jun 2026 05:31:23 -0700 (PDT)
Received: from google.com ([2a00:79e0:288a:8:7a30:b9c4:b9c7:bc90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1b754471sm15140848f8f.0.2026.06.25.05.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 05:31:22 -0700 (PDT)
Date: Thu, 25 Jun 2026 14:31:17 +0200
From: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>
To: Doehyun Baek <doehyunbaek@gmail.com>
Cc: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: landlock: Document fs.resolve_unix audit
 blocker
Message-ID: <aj0fldJZ2dl0gas1@google.com>
References: <20260625092819.1870049-1-doehyunbaek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260625092819.1870049-1-doehyunbaek@gmail.com>

On Thu, Jun 25, 2026 at 09:28:19AM +0000, Doehyun Baek wrote:
> The Landlock audit code can emit fs.resolve_unix as a filesystem blocker
> for pathname UNIX socket resolution denials, but the admin guide's blockers
> list did not mention it.
> 
> Add the missing blocker name and ABI version to keep the audit
> documentation in sync with the emitted records.
> 
> Fixes: ae97330d1bd6 ("landlock: Control pathname UNIX domain socket resolution by path")
> Signed-off-by: Doehyun Baek <doehyunbaek@gmail.com>
> ---
>  Documentation/admin-guide/LSM/landlock.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/admin-guide/LSM/landlock.rst b/Documentation/admin-guide/LSM/landlock.rst
> index 314052bbeb0a..8eb85c9381ff 100644
> --- a/Documentation/admin-guide/LSM/landlock.rst
> +++ b/Documentation/admin-guide/LSM/landlock.rst
> @@ -52,6 +52,7 @@ AUDIT_LANDLOCK_ACCESS
>          - fs.refer (ABI 2+)
>          - fs.truncate (ABI 3+)
>          - fs.ioctl_dev (ABI 5+)
> +        - fs.resolve_unix (ABI 9+)
>  
>      **net.*** - Network access rights (ABI 4+):
>          - net.bind_tcp - TCP port binding was denied
> 
> base-commit: ab9de95c9cf952332ab79453b4b5d1bfca8e514f
> -- 
> 2.43.0
> 

Thanks, good catch!

Reviewed-by: Günther Noack <gnoack@google.com>
