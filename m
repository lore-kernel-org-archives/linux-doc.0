Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A2126BDB9
	for <linux-doc@vger.kernel.org>; Tue, 11 Feb 2025 04:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739248438; cv=none; b=eMtCZH4WKJE/iWVNbsHty4fPSgutclCzTbGdpEiqHfCkNNkWtCryV8qcqZpSLvyORXw97uN9JfU+D8dKUVUuPoK2TNWPtAbxQMRoEgG0eVilz+AORZ2oto91tg4UvSnX3SBVs0GnwRN1/07vvTymxoSrMp1eSQol8yvtoukC3a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739248438; c=relaxed/simple;
	bh=NgpQKY7oOKJP61VlZ5CJRdiLpPJg2BT/Aj9U9AuZutY=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VWCOg2g9iN4EHtMJeMB54Y8ieCR4upBU7pnTdrAPb5ePnnmRmWFBVj7mXmKokGifhAXGMzZ7DJqpMIICPnJtkcL7PNWFFqKPwm3rc3ZViGrmtiW1BttHCgOQUGwgkhxBEcR9+IJwgP28iYKxBMOMZ7R/zI3Ytspbdjfzpt1sjTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q4tsptej; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q4tsptej"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21f5268cf50so52188395ad.1
        for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 20:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739248437; x=1739853237; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TO7TOi6Qj15AoVYfQyS7G94i3nw+FMQ4O112jMp/9WA=;
        b=Q4tsptejHZj4jEEakycUxLfNtbESRfIoAouXZbn3jfApa3rza/lDwVB6WE0tVzvxhz
         A58dMH0xZRLXsp7dHNYAwTkywkVEvXDzhl51RTboog/WE8k6zM/r5oPBehCTPKvpoGk6
         rUvlM9OvNSunUDQFZuS9W7Bk6m3hqgoAitOusTc9IGs1Y6CyU14FgtV+Ax9ALiLeSzko
         A3ZrDckRZ5Udoo5Qvy8z5PACo0bYIQ8626RujJGS5nQiYX2k2Ylb29YPVWn42GcT0MxL
         a4q4RVxAWECRed/xFBCiizt2zt8lquHmYjYlvuzuv9zkSpoJQ+zGyRQyA1glLK4uGAIA
         5AtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739248437; x=1739853237;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TO7TOi6Qj15AoVYfQyS7G94i3nw+FMQ4O112jMp/9WA=;
        b=PDZXqS5K6iGxM/Yxfq5WTu0wlrRRG14f9qmFkGd762WarlSo7nQuHnpL8G7CaDY9tx
         rwmTfcYN1fx/qkCBaAlYhHC4LOYYEXv8oIURuP7yxR7mV7kOMAv9Ps8Qu+VNYoat/Gd7
         W7TNGh1pq85bkKHA2kxZHZu/lvhvxgLkC3smFzE26rdtth7SFT8H2usrrDosEhU7fkUy
         zY1zBvfi1SrP/Ik7RVNUhaXKndTL8ZraiUnqqHMxR6CGXgenr5j3uNENXTJ8LbljEsFq
         VJPd20kjSNfeRersJi87Y+wNMQ/4rSUW73Y7iOFSnyl8Ul2TujdCBr5TkFXPCjD0Ptz0
         516A==
X-Gm-Message-State: AOJu0YyWIdfQ57zA9enzm2mkS3DrnFUy1A+HXPj8rdmTyf4ymo2b4r1V
	TveIo8EWar0a20nxGbbxt7jCPJRH2gVUrS+Nh+GyEK4A9cDx96Sn9UAHvgx5
X-Gm-Gg: ASbGncvXUPOYYcE4YLWbUbIfuVnj2TTy4yhgoyY2useByj7uxYR0rIjuIZlqm3ua70h
	Ir1xT10tkJWy9MNT0XMi6DZyIgoJFcpN0jO1H4mZeuFVxxFPxdnmzGiBsBfvPo18JhhyrI7gH1b
	dEM6dc1rxLE+OfzO8aA8vFpmow1A7bTiUlqxkpjHQIOY1fH34+5FhhDREW5h33UZ95jQySjXDkJ
	OWzKfIAp9GbGDm8bce56ZwXiATBjo32ky44gQWEGPSo1xInDQ4/mkH9i25kYiQiVWvcOE0CzZTC
	YcYSQzIZs4x2zaFOPRKLeNSFt+Q5KDd+kM2Bmg==
X-Google-Smtp-Source: AGHT+IEU0EugEek1MNnCP+nh7b+EkxoJKeoAeRtNm4c1M7aB8JLXEN5cWb82GCvpWB9CB60yHfSGZQ==
X-Received: by 2002:a17:902:cec2:b0:21f:53a5:19de with SMTP id d9443c01a7336-21fb6443598mr29260475ad.25.1739248436713;
        Mon, 10 Feb 2025 20:33:56 -0800 (PST)
Received: from ritvikos.localdomain ([2405:201:5501:4115:4de7:cabf:f8dc:899d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa511510d2sm5404290a91.18.2025.02.10.20.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 20:33:55 -0800 (PST)
Message-ID: <67aad333.170a0220.17df76.7e76@mx.google.com>
X-Google-Original-Message-ID: <Z6rTLiA12j781NGw@ritvikfoss@gmail.com>
Received: by ritvikos.localdomain (Postfix, from userid 1000)
	id 5F70014017A; Tue, 11 Feb 2025 04:33:50 +0000 (UTC)
Date: Tue, 11 Feb 2025 04:33:50 +0000
From: Ritvik Gupta <ritvikfoss@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] documentation/filesystems: fix spelling mistakes
References: <20250210043937.30952-1-ritvikfoss@gmail.com>
 <87frkl1ylc.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87frkl1ylc.fsf@trenco.lwn.net>

Next time onwards, I'll make sure to: 
- include changelog in commit message, nothing else.
- send patches via maintainer's tree rather than applying directly.

Really appreciate you pulling docs-next forward to -rc2.
I’ll be more careful!

Thank you for the guidance :)
