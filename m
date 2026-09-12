Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158F8343883
	for <linux-doc@vger.kernel.org>; Sat, 12 Sep 2026 14:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789222823; cv=none; b=Rplcpt+AyfpUKx5jTi7xmqTMf8D0PU5jtPWP5VoGQeyTDrurdaGtKO3OZLScfbMIAKi3aOSJz4IEqPhoj5105GOFiRSBQOXF2HDuXp2O5DxVpYc2V+i+MvQYsL5+I27Ifu3zp2zj9BhTYzSfkT1b97DcROIzJuCv9wleG4mP5Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789222823; c=relaxed/simple;
	bh=biqxF2WqF9FsEWFi0SeRE5ItXS6SATDbQxMgWQtNwgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lO61woYv011jiT29ijbdewwmAWvF29Lv91MqZE5skPH+3cmYlH0FgQW3xPoIeHTtnVKo1EnHmYekLbotvfvc8JWHgesZbPIdPSHZHMUeL2HhrJbjZ5iho9tRNJpGv5V2kGZihmiMSchB5Ed/5j0xac+QMapJGxNKmuH25sJd/P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X9wS6sgy; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X9wS6sgy"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39d654f02baso458867a91.3
        for <linux-doc@vger.kernel.org>; Sat, 12 Sep 2026 07:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789222821; x=1789827621; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=we0ycuhD13NPMWrxsYvOqSZt4f6T+4762jU+NZLRKXc=;
        b=X9wS6sgyPv70YucXExX/1Ce4CRnkgEBlcbO4tXFe2BDHC5ArRqa3qtidYPXbc+Eb86
         t0mtTuUgnC3wg6ofDeOJ0aTvX3bUhY5Ktd7u/+uecMOcrv+vBAhjk/aq9zz+u/HFyO+/
         j35JVG5kq7mNh+HuEE3Yye9zQxxnTCTJ+GuoOyhGUkS5sUPnXXGr4/ZHm0BPUWIbpty1
         Kq4WauWQpzAb/3mjBQtH6WP4wQm4W4uV+2X8I5QHGgF3Jgx7UaiH3mOKt2who7ft2dck
         plOwJ3A5714iuVwbgSw5ymHhx7MgqNunxTATC7VsY4aQe6zVBWd+3OgROJDd1P+Xs1Yr
         XOsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789222821; x=1789827621;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=we0ycuhD13NPMWrxsYvOqSZt4f6T+4762jU+NZLRKXc=;
        b=L9/D6MkI/vtY1Wk9Q6gv7QnjmxUCk0tRCwsM/nA4V/afeG81Qo4lkNYRiUkrPtkAU3
         csC+NGzEQHdTkpXa6wMTXHDPKwYZvOgsY1JEHPPVir/v45FP2jm55rdIUNL1OsrayJta
         hq8+2KLgjYZ2eEjED5r7+M2+r6KOonFHEbRILjZvBbb6VyRvCnvDGmIHBPur2KKSKB9/
         QbS15QBRJImuv8WuRI9BnRJJ+f6W4pbqyyl2vpgvJaPgqBe24ogieOILiYf3mUP0mqy5
         /d/pxDZ1e2YsKARhcQbbUhwa1IEPLsUY9veOcGoNhhz2ExNMH9Buz+yBqFPDAwoGOCkI
         BskA==
X-Forwarded-Encrypted: i=1; AKwUvBxzVuFNZLIzso/9Q3GFSqHJCgCmKwm9GwMeAHbygArcVYHmZLOxQ2zMu2QiEcI46LOvjxEYHbmVHP8=@vger.kernel.org
X-Gm-Message-State: AFuF++miYaSe1FnjYvRlV5PtVFMbvuEb23t4Q9/m5Lecyu1019Y20Yeo
	ci3XQKX7ADMVCrnxk6QoNb9l1LlHJZE6C1TG2s+/c+jwzYQ1Z8CjU/C+
X-Gm-Gg: AYBFou0R1lDsfgOuE6zyzxujVN01d7kAGK48vjE3gQKGTKGgCtrt3p1sOJy8KqIhQLP
	zKAt61jXl0+X3ne6Y4/JHfGRCbtrgMe+pXWFE5yULD0O02YcCbcdC061W0YSzSSWcW5uIxuhZry
	HiY25wEb+A+mokYrkVUkVmHcUms9E41lP6QDVsjqVr45F1VAnrbKA+8TKbrY58z+swiCfKSqiSt
	5VEcoqti3AwbjpJxaJKowu3rEGnchD5tuFBlpN/2p1VmK/nFDFIgCxkx3zTAuY+APl1Y2SdlaGr
	rrlC3JtDITu1mDYqJBnI9JeOKetHm/Q22nKVnSX3wmOazg9Ya2k7zfyLhydXxmbtoGXyidnM/SO
	+x7JiDCSsyeVxz8h14ezyPCpgnJSIsvB/wr84DITwMwzDo76QJZ6uc4og0tr3FgQ8OR/SRWfcqm
	XLmXWp0jH2wzZSzL7M0ubvegHwh+QVySfXurAKGOBmSLI8axk3aUqefAPRlRkKGLqCnf7/9Q98+
	VWQMGPId7yB
X-Received: by 2002:a17:90b:2dcd:b0:398:dcfe:967a with SMTP id 98e67ed59e1d1-39dbc6d53e5mr5724044a91.17.1789222821301;
        Sat, 12 Sep 2026 07:20:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95994375sm10641268a91.17.2026.09.12.07.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 07:20:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 12 Sep 2026 07:20:19 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 1/4] hwmon: (pmbus/core) increase number of phases and
 add new mask
Message-ID: <5d6bb7de-5cd2-4708-b894-fe8648a9c49c@roeck-us.net>
References: <20260911-hwmon-max20826-support-v2-0-5e30cbd97d84@analog.com>
 <20260911-hwmon-max20826-support-v2-1-5e30cbd97d84@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911-hwmon-max20826-support-v2-1-5e30cbd97d84@analog.com>

On Fri, Sep 11, 2026 at 02:53:37PM +0100, Nuno Sá wrote:
> Increase the number of phases to 16 as a new upcoming device supports
> such a number.
> 
> While at it, add a new mask for controlling the source of the output
> voltage.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter
