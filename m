Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094C149E14F
	for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 01:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789088559; cv=none; b=PWxiu6fXzTQNX21L6BCsaDmTEAe9k2p919qH1QB9DzeqpCK5WzKV4aCp1Uk7/TwY4daSf9tJx48rN15tpsNM1tsRZ28e1jXE/feYA96bgdlSmg7kyskq/d70BUR9uCokJeOuLy6armddBjTblLVW+fQsM9cwWbM1Jm00P3Q/dhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789088559; c=relaxed/simple;
	bh=TiFzUS2aHYLoApSqvwEeB9zLb2sSir/BfO8lZ3oW3tE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k42hSZ3qc4ejVECydu4zDGJLe6VQt/tdDBGKj6XmpirmwSGtDMX2WlKBUAeopBRQq5K+YTq9ynixiWdsmVmP7N0eJPNXc9kODfIuG913KKuKXR7DcxRYV3kzbn3wEu98gvVwXpFFt4luLU3gU9wPYGvO1AbXazTTqSc7KhldoKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKW7dDZT; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKW7dDZT"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-66bd7857841so297717d50.3
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 18:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789088557; x=1789693357; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gU2WF9XqL472gayp+lMBaEHlfREfA6uslBJW7Hl4Whs=;
        b=QKW7dDZTUEnoo+36DM4WzjJ5RLrqB2Fia6IP9KMuwEerQ2zrjzy0l3gpL6/gfeh5II
         2L0+Q1zu0FKuwKOqp7Awbd7JsvICfR4oLW3v3zQao25YddawqV4rRAqTSVx1zFBxd4ui
         RgLrsfuenJn91A11Cw3WRCJVB6uaUlknqkgNAihbnsFaHdqW9V7eBJuu9MDJC65Ork6O
         9MWv+/RQj4MWy8L4MSB3pbTro4X+4Cmsopu2RxKbnP4S9GAV+bonAbanO5sVcxAU1YZn
         x9Gyyc+K3jRNvTAWdDL7d+nzycYX5sxIQY3nme0W2OuMgjPhgM2jnAgjPTv7mYt38XCh
         priw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789088557; x=1789693357;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gU2WF9XqL472gayp+lMBaEHlfREfA6uslBJW7Hl4Whs=;
        b=kCXUsY5YjFw5WGO+O5rP4wCcQy5wf7NDmNZ+CrSIV25uJOUEnjJC01lY5cX4p6rmpo
         GrtBJCnGRRSMB0fOWaOZmxd5qd9i2xYksAqcw1wr5HFc67EDPF+H4FWfN+TZ05xLTsnD
         3TJxlTUjleHaG24lIWX+X2IakZKd8nWygRi0og1ykdDPMZ3QaPa2iVLU13hTtL46K3/F
         NBYwsfz9MGcZeS8BkLFBNs2a/prRU8ZEEGtyLo4YBJG8yDFUdEHDTtJeR/IwDnQ6r2s6
         2w23j0moSXIUtmmDVUbkqf5GUgaSaWYlk54qDJX+tD6CJ7k85qh5A6NgpXD1CaxTNDx6
         A/8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxdIrWh38mtS+/hU7kTKZLgL86B8ATiIAphRhBnzlK16fUaaM4n/okw3Yq6ZumjeqEp4nbgpul44uM=@vger.kernel.org
X-Gm-Message-State: AFuF++kIlTCnPEDnI6Ajr7L1Z7B2OlwhDZbzsVbzoQU+LnUsON1bLw3W
	OVTPhmv2zHnM/MHup5HRtE4HBrjBvzezcQDA6mdCM2m9ECdBgA04yTOE
X-Gm-Gg: AYBFou3lNqhoFDJ/Qb+tFbLFe/Wmq3/ztqJWAewMyacFhJ+vkoFF0Qj4OjF81xphXyt
	e7whv+v3z7Vb4wa+7grpsXaxgFPXptGkLq1ew61bH2IUgZLm+7xsllDrCr9OfOMCOU4cMTmjFEo
	RFTgUtSw3G/SOeFKiqraQhpYvsjNTDEg3Y03hEhC4hIoMqwZwsDUxPvCIIKED740YWtPaCxnjhH
	pQk5Bw0QQj+nb5L889lSWUBfNZauMMP+xCLUJ1uED4QldJjSInzVed9BdTrw4qLvkk4yWE0X/dK
	ivrOjcO6v99aBMrZIdGM+4h3iKprSVMe4yRnocOkGp1Gcx4kgsVrNpZw7UA1Eo0Wm3QVJethY24
	A9gOg7aPegregBLz6WVBMv1YkDsKEhF1KVKYwmTD9EbUZ4CgTkgG3ANAwOTxkgEi1NrNm+2n9cf
	4/llEuKyoG8EFZF55JDujy/Go+UQFEYFIQSTe1ZLaW+1HO0KSFHWSRYXQG+FbWwu4tDYZa8NK1u
	oGSh3invjMH
X-Received: by 2002:a05:690e:b46:b0:66f:a1e3:9c77 with SMTP id 956f58d0204a3-671245584afmr961357d50.2.1789088556949;
        Thu, 10 Sep 2026 18:02:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed64fcsm1826445eec.16.2026.09.10.18.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 18:02:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 10 Sep 2026 18:02:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] hwmon: (nct6775) Add support for NCT6122D
Message-ID: <0c683a7a-a824-4b68-83d4-3c640d90f876@roeck-us.net>
References: <20260909-bootlin-hwmon-nct6126-v1-0-4e85615fef10@bootlin.com>
 <20260909-bootlin-hwmon-nct6126-v1-3-4e85615fef10@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-bootlin-hwmon-nct6126-v1-3-4e85615fef10@bootlin.com>

On Wed, Sep 09, 2026 at 08:25:56PM +0200, Paul Louvel wrote:
> The NCT6122D hardware monitor is the same as the NCT6126D, the only
> difference if the number of UARTs: two instead of six.
> Add it to the driver using the nct6126 chip kind to avoid code
> duplication.
> 
> Assisted-by: opencode:z-ai/glm-5.3-flash
> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>

Applied.

Thanks,
Guenter
