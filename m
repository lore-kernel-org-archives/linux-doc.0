Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B19D2BE7BA
	for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 15:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760455125; cv=none; b=XsPtd8Nm1+7siylYimy4G2Vs1P/8GzihG1HYvDi6BWc4orFSMUbe487Ci5/D8TL8QJCFWIdvSuyFBIbxE0rdV8RHYJmYrXq6vgswJ3UoGQ33mjHCa4/ldtat3ZzeoRJ4ZRtBudUl7ycnzjUYyzgiQbwUn2XHokGQUSMbRHTgmjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760455125; c=relaxed/simple;
	bh=JC60HEInNluqzF3bnchV7EOp617mC62c6zir/e0gnlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i+/jFR3YPjy5aimwiIi55+UFSgzmbvn4CXYYHvxperUtu4Or7aag327z4XkvQEClFuXLpV+Ckv6qS2f1y9fjDbx0iRSW1mNJma3VQqoyT/bqYWBOg6l5pkPntU+ERT2i/LLKCmaXXLTTrHUgFOr6Zx0QMkyLnRA2/89Lb3K/bzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UwFrN2YG; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UwFrN2YG"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-27ee41e0798so87608375ad.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 08:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760455124; x=1761059924; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9RG2muNaSakDWxI94gPRyAVmL2U1gaeN0a3vQP8Zu5U=;
        b=UwFrN2YGIv3vI5HCIqsNtILexdt139q6LdscQO/XGkyIPzkkZMwu2pie4wRdr9FvQC
         2OwsmvlgG0/wLVlq4PEdF7/jVE3llgJc56KR9H7D1VyCytivjE9hM4gbSb74YnbH/h2H
         OUQ6ENszTnII05N6TeEmS+f3N7SQpBkjRIY22r4cjc5rmnUbMZuVG6AGNGn7pX8mMNwE
         yCMEGRRaIcMpGTwxWVhS8d/thUB1nPjpotGuiZgnr8tXRRq6MuwA7dDl858exBOjM5MC
         r/zzZjEhhIOTlP2l8LdlAcmwg8YQizEsC8MQtvttoB1uKNol6qsMSvXHdNPjzu9mT0g6
         2TLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760455124; x=1761059924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9RG2muNaSakDWxI94gPRyAVmL2U1gaeN0a3vQP8Zu5U=;
        b=cIEZsjiuPz80WTKcOlTOly+RihqiddqaPhYkRS4Tk47KhAjj/Gr8l5pNAQadkvaVjo
         aJh+7OsZ68G0LbAmkOSRo2w3ebRDoQw16DkcqFvgMBn2jNAgyt7znvxGREpnmGcPRh6H
         w/tWhf1Wl1TsCiSCvFtCFnL0a/HPvYUUiodSBoXXtQAXNe6XCwqF/ZCaIWfdCwfjKzcA
         61VGhu0NyNa4J2v95XkVQMG13YEBqS6BY//Fo3LvFwHkwZ7xDFTxhMEFMcJPCikv9Zpa
         k73O6PtJWnXh7g/U1YTWy8X4liJDRNPCzKxex2Ilcp3SIl20d+usIbURFFCHKLno2x0k
         lecg==
X-Forwarded-Encrypted: i=1; AJvYcCXS5Vj3Bjm9dsej4vkOrvvXRZs3Y6iC6MqmzwanzkmnMLgqipfrVw3i92mfBHDvhGxSvidxxLrTUQg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJsr6BcTp2SRaSyDxOia5la3RqI9RV3qadtK5aynJsTb6VbNpu
	jjJP7/KzdFZau5lHY8VXqmvhz097KZGxbZhX4nieGmIRIl+0FRUuepx5
X-Gm-Gg: ASbGncsKTb972B/V0X0cBHP5VXpryL9wngOGgRO3NszWRFM84EcODZpdGx8ptSDQoPg
	uHsGpX1RbsReJZlPT36Srl6lQ1rmCIjjLCm6iTbgQ8B8dkHXHZyzaK9E0Ko3xEzNWGnAw7yNknu
	qDkohGKiuEwYVX3XzJZUQQ7NRTTa2VLYonBzAVcz115Es3wRPjNVKbWKvvk3vBkkhIpTqzn9UwL
	7uC14WtAuh6DT8omSJ81z62cVb4MDpRQtPtZ+c761Qu1P15ycPXuwgc/vAIVpWNhzhNW6BTkpYJ
	X8ZPWVeJaE7RHhhzBZKlEgagUecVW3M6m0yQgDBx941RYb3mU7TFzdXg1CtCCrM3wWAj7E2Wsev
	y6JrHerqdmujuK68qgatSxqPM6Fol9vorI9enObqKyc+Lrw1xoNwocnyIVhGq73md
X-Google-Smtp-Source: AGHT+IHIsEd1SylS40HYfaucznmGO/M9RGsNWRga99P+rm4jbrckX5mvU1P7jlaSDBhOyjB7a0ocng==
X-Received: by 2002:a17:903:2ac3:b0:281:613:844b with SMTP id d9443c01a7336-29027418ecdmr315810205ad.52.1760455123527;
        Tue, 14 Oct 2025 08:18:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e1cc53sm167544325ad.46.2025.10.14.08.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:18:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 14 Oct 2025 08:18:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Cosmo Chou <chou.cosmo@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, cosmo.chou@quantatw.com
Subject: Re: [PATCH v2 2/2] hwmon: (pmbus) add driver for MPS MP9945
Message-ID: <7df1419e-18a1-4656-aba0-2f82914bcfc8@roeck-us.net>
References: <20251009205458.396368-1-chou.cosmo@gmail.com>
 <20251009205458.396368-2-chou.cosmo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009205458.396368-2-chou.cosmo@gmail.com>

On Fri, Oct 10, 2025 at 04:54:58AM +0800, Cosmo Chou wrote:
> Add support for mp9945 device from Monolithic Power Systems, Inc.
> (MPS) vendor. This is a single phase digital step down converter.
> 
> Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>

Applied.

Thanks,
Guenter
