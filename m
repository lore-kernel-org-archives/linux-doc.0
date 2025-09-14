Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939541DA60F
	for <linux-doc@vger.kernel.org>; Sun, 14 Sep 2025 01:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757811849; cv=none; b=uksjAvTCC3gOvONjyvV/jXO+JNDs1V2q1FkMN93Cdv4Zu92KxJZVXe8E3p/kJjhABzv3hpox1ZtVvFkgUgUwQuhxeptwm63kpcEBAfLGiONKJQdHrB/DkFrI9S79olpAZV4fCBCwDLOAlf9KVQE2qKdfTBFZUlJMwqvyw+jdDn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757811849; c=relaxed/simple;
	bh=sXDskx1pHKUhsyRk4wnDL5fpcdP5rYakGAvizdofSKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I/lE3f2hSeZeFFYB9lz1G3Lo+8ZrZ9kpYobcZ8CAeMRuTjVQJFXY7CqvXQjB+m19/m0mfM29rYzTmQ8/99yDyaHzuPLJhaFA7vnOCopPKT9SIk6vLbu03V06gdeK9tQaiJc7OG/JIfs9mAESAiwMGoONYS9foGBpxV8AuVRy9ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cYBkNmZz; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cYBkNmZz"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7725147ec88so1742367b3a.0
        for <linux-doc@vger.kernel.org>; Sat, 13 Sep 2025 18:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757811848; x=1758416648; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1pS2DRBcNvFIKJohLTH8vUf3BrBi5wwLcfUnLVRJuUM=;
        b=cYBkNmZza8YaDWKJEScw63owql9iY1zoXjPf+Aeo3pX+CvSvdU+21QIed2y7LWX3aN
         p+nKkysLhyc62v7gsv35DevyBbnwMf7QJHtvH69XpOZgW74XTuhe26yju2HP69wioIFr
         dWtmc4lcPd9uHiJs33Jn9sT2LLCQfsjQKvi3FnrZga4OL1kNMRoXshtMfIephOp6oDWf
         /m6WXPyhsd0PphRtMjYB81PoQt2LDhD8Q2Ne4+yNOCEQGKUIm+FQgGgQRzBTnF7oZoTf
         8SXWAY83GZRG6z5nx/BQ1fIhwiHAT5iRgD7z4wKUIM3wQ06OIM1SrCVwyXzVIHNgqFO/
         40uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757811848; x=1758416648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1pS2DRBcNvFIKJohLTH8vUf3BrBi5wwLcfUnLVRJuUM=;
        b=f2Wm9QyvjeMSum2RXgUuR/EtqdqA13BPp1T73fBu8WGR98cRmXMG3gIFCN4ArNxj2r
         CZKYx4+sxzzgvip+raxBWyGC1MYs2pPUckcpHG6iB7dEQGDFMOzWlzquUQx62Wotc9D1
         b7R9SNLyJtxZlWRkMo+LVElpgmssu+Vii4Ry9J3frmjIwFRvA3mFBgQEZ6YfiCTh5B4z
         Zza2MMS/uoxbUC2ddBIuos2tB7WVtAMSHWYeYYStPqsdwtBfiIz1dVj99G5k2kbeKICo
         KQDEJqEJJuuamILK3ktATc4m7LcyzNYebtB6nI/yW+TggEwXJfPGrty7nGRhNnyQ5EhO
         aOVw==
X-Forwarded-Encrypted: i=1; AJvYcCU35DkjXGT1uw8JZZmR0vuyeydymM+u7uekg8hL2cbuysKbyBQqPmEdrzE25SItDjNGqpAZaH+RWUM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy43P/WpK43s3D4M9tub6YH6Lc1n26oSpAV7nfC8BqlWTFvhVOZ
	sT9S1VDXDXa3EbBW0B48vBqljrNDJPtV1bkImWBsf9O4iq95yOxOJr7o
X-Gm-Gg: ASbGncti2tCTM2WuzVPWoGW39v0Y4Js2QsPAbMBnRsAfUkFyblaHxIFUd1r8C6RMRUW
	R7j+g8XYaHM8NlhWtvVoXBQnA/lvdw/2qUsRzFughl2ElX0hTJz/gVmHPfDlSjt6yC5IyWQlxSu
	PTA7pwOBoX7epa1KczUt+a+ROQpe6K0smescTYVS0EWOwWiPzeRQa5eIlssEL6w4VEHDWoM2SO/
	t4rvqh+ZyOij9YN+xrqS0kiX25+q2sXbn32S8l24d24b1PI3JpAFzxCz4Ex7ge5b9yEXA28JdVW
	L87Brr025lqHo5Eb9RRqUtEqV1zuCg3dL9xO+DqcrKCIQmVPqkIO6mmBKRsKHI3trX6t2rI5JLD
	sWsN67cwg/DoIG8Qd7sgd3w==
X-Google-Smtp-Source: AGHT+IFdV6SKq+TGgyDQArsbIgWlBA9pxvOaDnkpzT+VbVAP/25LeqPRmkZTK555qqZNaCRxU5POZQ==
X-Received: by 2002:a05:6a00:1881:b0:776:1d55:55c8 with SMTP id d2e1a72fcca58-7761d5556f1mr5467317b3a.4.1757811847675;
        Sat, 13 Sep 2025 18:04:07 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:81bf:abc:6590:f690])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607a47310sm9078733b3a.27.2025.09.13.18.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 18:04:07 -0700 (PDT)
Date: Sat, 13 Sep 2025 18:04:05 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jonathan Denose <jdenose@google.com>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	Sean O'Brien <seobrien@google.com>
Subject: Re: [PATCH v3 09/11] Input: MT - add INPUT_MT_TOTAL_FORCE flags
Message-ID: <rksu7ejddh4n5ojqsihqelyvc5m3cx5tc5zspdsa5ke72yxyye@gq2osygbtxsx>
References: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
 <20250818-support-forcepads-v3-9-e4f9ab0add84@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818-support-forcepads-v3-9-e4f9ab0add84@google.com>

On Mon, Aug 18, 2025 at 11:08:50PM +0000, Jonathan Denose wrote:
> From: Angela Czubak <aczubak@google.com>
> 
> Add a flag to generate ABS_PRESSURE as sum of ABS_MT_PRESSURE across
> all slots.
> This flag should be set if one knows a device reports true force and would
> like to report total force to the userspace.
> 
> Signed-off-by: Angela Czubak <aczubak@google.com>
> Co-developed-by: Jonathan Denose <jdenose@google.com>
> Signed-off-by: Jonathan Denose <jdenose@google.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
