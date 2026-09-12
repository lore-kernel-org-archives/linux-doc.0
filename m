Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC3434D389
	for <linux-doc@vger.kernel.org>; Sat, 12 Sep 2026 14:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789222960; cv=none; b=dAwVuozsqsurhkArys0BzdcEqNzCr2bkjmPA/euCKK+4oxvrsYD8grNb7fTzFye3HtGE6SKpVJn90fDTwgBVJinwo7SYU7kpjy8w87PoOd0uSeA2/btBIjQkPdTXh+a1JLaH+pgXiTku+HGaZAhj8xvI8C8T2FPsgb7mVbQ06ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789222960; c=relaxed/simple;
	bh=BW28mE94cI/hgrFj+e0ecUVL8i6tpWUZ63tepiAvA6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gOLQxRaxSLJYpdsfCR8y5RYGxFqPdnhK4AaxfM3yQtmBo7Zq/HTPVeb/5/TTcbp3J4XtKNKHvHUJa+DcCGKhf39Yk94bulvXok14Q3chatsXGD9zSSxcoQ/JtxnzOyUgKK4EgKVc+C+yH8Er9ACmqJh6aJZLip5nO+MJy7S3kZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WOwuqunN; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WOwuqunN"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3964e480f76so2564527a91.1
        for <linux-doc@vger.kernel.org>; Sat, 12 Sep 2026 07:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789222957; x=1789827757; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AVt4uFTNHgLhaLqB7E8cbha4z4fxoHkYOO2KRoI60Y0=;
        b=WOwuqunNbHOx2sOl3QCvgT4c6DzpN5Ha3wI53ThQvlJ5YrBB8NCX4PDAm9d+4LhmQp
         XU3raH8AjEWDj1tzGNBFXB7hpWVqmNPyP35xqqkXKdBs+/wkfOTish8RANpGRJAoMCmd
         FtAa4GhsF7ADTVZz0qkvru7GUnm0DEwG3lOyU0+oPk/9Edlp3fyHrhkyVFMeSuy5SmoW
         fNKNo1A1BdOCu2zBfHbecjgaAU2t2/W0I5ft/yd4I/HhTQ1XxkF6vHRgD8qZfZCvZh9J
         xWbg1CtkHWI7M2f2QE2Oxaa0UsygIZHII/rKOpwm1khCYMwnR+gSzaLjeybIv/NF+p1W
         kFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789222957; x=1789827757;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AVt4uFTNHgLhaLqB7E8cbha4z4fxoHkYOO2KRoI60Y0=;
        b=CL4o6yZSHTpMuv+dDcuyrx4XZsLhLdYnhae4I9Zw334tQQMGEM8IFQp3o/jtTLu4IK
         1ynbzQlX881ei39h+zlnncyKYrQjefIUJZ1irfhboyHqr3h+WiE8neo7BWX++ZKjMnPx
         PpnWdG4jQIOmvkLNrKuj31kr/9/+Y2YM0O9wLtUF+xbnXLQNLzq2MzNDz6uvxNNFzeRz
         OO+goEgaHTlFbGg78wkchsqxK8X/lFfiY+UVqrG25RhFdfflcK7lIrE5imNrYBXGUhEd
         TIcnTZfYn508T3iOI1pnDNM8O6i9xjpSKbZZ4FbI/U9Bb7vGJdMcqZVz+ia64of834Nt
         wlWQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtF9ImvmWg5NtljDMzniLAkN7KaimhlaflauzagJaSJ5f1owAs/5qg2x1yo2FznTEgSe7+n9+rflE=@vger.kernel.org
X-Gm-Message-State: AFuF++ncHtk490M2+DAtQEzvoiqo4nzN5uSjnj3LLo5OMLtA60pRrjJx
	JCVbw9gXlDOUKMg8AVqlFHFV+nYMIYu9/Q+xffhVavzqAWUE47Zj1PnP
X-Gm-Gg: AYBFou1sbSdIJRshYu3OXCO8Kxda4SabUz9smuQJw/rbclwRfckGtWepp8jHsUjafVF
	XtFnwknSq00/YMvQvYZbm4eARr7GMMb70+0G5eYz327YrYz4iA6TlUSzfBFfmyIfl+S1LjML0OR
	LjLJfYkSgNmZK5H0eQ5UEgD5ZXYcr8veM1uwDng/TJa5uFVE/9mow9Btm8j55x04z18+83EDgB+
	a/ZccrDdKCPSIMQ6HXbk6K5CrQzXGrX24F4sDnbCnK5YNEbpXxrhVXYbgVLC1rMvAWJ3ppJWGsJ
	bJliCdKIAcOpcpJHVUEwhCp2u3Z1gV60oSlC0UvvGkJiJuN0D14bOnbTCmZbGWCU/Dugp/5xRiY
	d7uF0tYSnJPEon3npUZSMpzyIT7G2qntA0mOkXUnKTc2BbmiwmuVu2KU9uOzjxDTLzW7NdEaJvN
	iZhbBYfrLgURp0TNpGb35uPTHXNVIrEYIx0Spi2E56l04U5ie4mw/BIMytkc+5iVMtPdtdn+a4V
	BHaUOfwy+f7
X-Received: by 2002:a17:90b:35d2:b0:39d:8d38:8b04 with SMTP id 98e67ed59e1d1-39d9bbea1d3mr16345801a91.1.1789222956866;
        Sat, 12 Sep 2026 07:22:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94bb0119sm11167533a91.2.2026.09.12.07.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 07:22:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 12 Sep 2026 07:22:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: Re: [PATCH v2 4/4] hwmon: (pmbus) add support for MAX20826 and
 similar devices
Message-ID: <4bc54f30-2a0f-4aef-bb43-b7305f623c74@roeck-us.net>
References: <20260911-hwmon-max20826-support-v2-0-5e30cbd97d84@analog.com>
 <20260911-hwmon-max20826-support-v2-4-5e30cbd97d84@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911-hwmon-max20826-support-v2-4-5e30cbd97d84@analog.com>

On Fri, Sep 11, 2026 at 02:53:40PM +0100, Nuno Sá wrote:
> The MAX20826 IC and similar provide a high-density, flexible and scalable
> dual-loop solution for high current cores for AI applications. These are
> dual loop solutions multiphase voltage regulators. Between Rails A and B,
> MAX20855B and MAX20908 supports up to 8 phases total configurable from
> 8+0 to 4+4 phases, MAX20912 supports up to 12 phases from 12+0 to 6+6,
> and MAX20826 and MAX20916 supports up to 16 phases from 16+0 to 8+8.
> 
> Co-developed-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter
