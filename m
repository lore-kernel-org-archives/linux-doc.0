Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E52468C37
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 11:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786621370; cv=none; b=SmPu7oxNDuA/e9PYN+FriLBhK5qdHhvjpw4D2o+uJMvWlw/TMbYRmXw9FyqUzfR/hg+ev0L3fGANhVmjX3yZOHNvNdCIrNBfC4QHcK8H0Mz72nKRApMG+IGBkR6TM/6U4qm4ba/ebwDJkTh4+0mUST4lCZm6rwRgj7yvN5QhvDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786621370; c=relaxed/simple;
	bh=I2n4qjhhhXqOV6Mw3XAqQ4bd0fYcs3KsEhWb2f3luH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xs+NGUyc2LWuESiNRupGMcGhRwg0vZsGs+gmuea/8lIC6OY2ghFr+Bz/+fTSjzhTd9KaA5IQ6D28C9kZqb0iIG69WJQKywM4gNDazM3YmNdgno6b3NyrTG9B6Hjq+mKknQVYR6IGBysw5Hg0OAuNFJtSqmHgTThQ9NwKKSaWF48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gX/26Mw/; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gX/26Mw/"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso483339a12.2
        for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 04:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786621368; x=1787226168; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UOMzmZ6AkX0Pofy8pg2nfdTClH+/W4B3MQMVnCijhO4=;
        b=gX/26Mw/QY1VqODNDa3jCWLzNJXkqIO6IAYIhs4aRj3penMFibzlYb6RZBcQXG6S72
         HV8ToQvUOv/x6/dseG1ihWyydywhDLS3LdjPjCDJj/Y71iNzUDIe8e0yuZyKEQ2n6rkb
         UNBaCM2lk1zX+DoFIXctUfF8XQ4QGZJAXDje5+WDXjDSIYJy0bdBXGCwrWvHn427u1/Y
         tkmcq5UpfVwXcF0bphI3xoNomjXl+4kDf7Em6FrosrvVvnzB6Tc6nf47YKPEZiAzbkP9
         ArU77fZzX2wRrgdcPt34RBbo2Qgyzc7cCNS0+ERI/TEZ8OOCg/LjK2EEJiG7q9TOF1g7
         K0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786621368; x=1787226168;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UOMzmZ6AkX0Pofy8pg2nfdTClH+/W4B3MQMVnCijhO4=;
        b=UpvNzUOaei9bSJE352JyHY9VClCsmTNdJfd9vx2XxdkVnt+NMe/TaTY3lIhu9TAmpk
         GPlaidlafIP2lJ2bHQt4RrJ2/lKAwy1WUcbGl+ypxMbk/bdk8t6rAvtlFPcQj4+k0ru6
         aSV0z0BuzolzUnFPVyp7ZuSH+h0u/4h0hUShIDPRiBvVkQHEeuhJ8ev5pLW6jsuUOAQA
         31bccTkQikwXV5B/USjWUxvDVB80nf+9+gbcKwh+QUvdFQXGmjp5kk/V+uF1NDUmXlDV
         WDlYdQNOf4UyvYOKQtkrsjmE8vlEv4qhsEMfu7W23F4SvPMZp3yjSfQvwrb/BPu32K3x
         Ei0A==
X-Forwarded-Encrypted: i=1; AHgh+RqPOkFY9eQm8bNuni+2x2HchXy/5Pary8iADXONFcUOZZT+c2etWzwDRsPbDlh0rNPgwsuz5DWFUYU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy66htU1xkcAzkyhTeE5GXHoSPDb9Jo3q7eTLdWbFKOGBl3xbql
	h0QvAikNChKmGYCVwMtmWzwJonuP1ZjngI7k73MQr8Xoc38g+uSkFmy7
X-Gm-Gg: AR+sD11xH9AU7UjJB5vcfV846lVU+8vLjL58ebjb/FmkIozuIwdLFQAfuB/+jc+g0+H
	OJlXdJ0oInXNGqEh4jh9zKO/WQiHOesWXLiUsYotthkdle9NK/bgUWbonCaP8u3MmwSxid/SkXK
	F85Y37rhtMsfilpGBHAUpIrzmgrccKAuQFpggHHErgG/e/T5BYw1hF6AjTvCr5g+yqhLVHyiyCt
	822ZgeztDFcFZcuFS5jGTUueyKIqONQ+gyHRCe++QyOWfCoGntcB1yUtaFoskxIs9IqgCA+4uyl
	e9yCnsDXTfc0neNExMbbTvkJi2dOcmcD/gmTyiycQ6ifKjk1dA3s202zFdC27VmKWRfBSEp9wax
	VnEOnZn+/0EW49vTK+LGnxwQ7+vlANq0ShztcJUff4V4plu+SsqRi3kZlJTPzUsocKyZ39s122y
	AKqRDXX2Yr42gqqb5JfglG1I485c1ipaXyhF8TQRAW/+zSVXTxf3UF7+eEnROsJBKCj/h935Gk9
	w==
X-Received: by 2002:a05:6a00:21c8:b0:847:99a7:c751 with SMTP id d2e1a72fcca58-84fc6e290f8mr4868282b3a.25.1786621368311;
        Thu, 13 Aug 2026 04:42:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbef5cc4c9dsm919388a12.0.2026.08.13.04.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 04:42:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 13 Aug 2026 04:42:46 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Marius Cristea <marius.cristea@microchip.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: temperature: (EMC1403) fix hysteresis for low
 limit temperature
Message-ID: <01a08417-3846-4842-a539-3ed0c1f7d6d0@roeck-us.net>
References: <20260813-emc1403_remove_min_hyst-v1-1-43a0d05d9f49@microchip.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813-emc1403_remove_min_hyst-v1-1-43a0d05d9f49@microchip.com>

On Thu, Aug 13, 2026 at 11:40:07AM +0300, Marius Cristea wrote:
> Remove the hysteresis for low temperature limit, in hardware
> the hysteresis is applied only to the maxim limit and the
> critical limit temperature.
> 
> Signed-off-by: Marius Cristea <marius.cristea@microchip.com>

Applied.

Please use "hwmon: (emc1403) or similar (depending on the chip)
as subject prefix next time.

Thanks,
Guenter
