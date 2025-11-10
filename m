Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72E321D3F4
	for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 23:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762816560; cv=none; b=KdYjOwpTljgcrIv44Y15nJC135sy5jrdoLxMW+oacHMNhKpvNd83ixd68jk/nkXcCMzf5k4Lq8H7yTud1KP98y8JCKbsR7GJaRTI7IvaJM3zi/mxzUCKgdNGyPy7ZZNn8g/TLkPJaybabg8rLC4RP88mHfi+lxcrFd7EkgOWWto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762816560; c=relaxed/simple;
	bh=h5TTiI/L91Gy+XLFx/Zl3KrvUTe7SfQYuWBRrcnVR54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ekf81mREVdXKNOy37B87eZRLeyNMd3vCuDHcdq5sNHP9SYjWYKUCt2ibkiEfxj5ru3eiiDoVBx13wU+Te2UmBAVMD8jPmO3vK6AkVdwb9CMLMx3b1jmXqj7TVuxXXVw6Tj6QeKMFwCJ9Z0NOyFfVUVD/z6G+/+XI2tyS7OJ48cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DERuaMvx; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DERuaMvx"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2957850c63bso2855785ad.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 15:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762816558; x=1763421358; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tTCBfyjKL85nI7lncbdUck6wtAuHEbruuMTez3UdOuA=;
        b=DERuaMvx4XwTvfn4aCMWr74Rj+wFrQbzox5lH6uq9HCJMjMsVRuba7ar8ka8MHemmo
         UpqHqmgi5xhtdky+1fE8K33yw3cKczDTbdgECGdZ9aQINbmykbd6VWlLGDQE+Knxp3pK
         GxEyRxP+BM07SYEPtKkkY/V2VeG9JWQhxO45Q80DKG6HYrLjioUD39KsNvmp1R9b112Z
         UjSOIxMpLb48ILikt2AL02ml3msWq1vCqgoVEOADE/07I6lqZ/YFdbIhz86XysKoQy4t
         Ui0PEbzt+40oYIkJXAXr+4Cnf/J425zG/fan7nxgtUKYfWVQiCUlpQ9mVANzLbuUwf1X
         /xWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762816558; x=1763421358;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tTCBfyjKL85nI7lncbdUck6wtAuHEbruuMTez3UdOuA=;
        b=PKY5QDHME5BM5hYIPv8ZclfEZusrznsbqypL56ENCObKY2giXhN1Md0qtqwFFP8RJu
         NvdaFgA5chDb5OE1nJF2Tsbg1C8ib+K/R85azyKPZG/nn97lusuOkci8IjElsnl7fREO
         5XOSAJWhiJQS4vSWsLC/QRuHdz8dseng6JNtlcyJTnroPzIGhcG8WtSFL0NuC/VGoa0Y
         D5mgakZ4tG332nqAWYLtvddUEHwPCZCEdWcRfo2S3XpdbkYWoRi7c1aYw1e74FEFvyVl
         TMBu6SiCRaQZkP4SqnmMkC66Z1uywFCmXO3BOupiMzqsbW44HObPnlEsMrPk1cXsFbqb
         Y69A==
X-Forwarded-Encrypted: i=1; AJvYcCVM4AfcrUbuN4yiQNaSxM+YbSaoGC9jIJnRgMBNhNkDvWEABVDC4he4O70rUSvZlmgAttJCIslpR1M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDucP9LNm+vhahVmXvGAcwEEew0SmFs8nmJ+UQPxwu8OT8l4ek
	OE+lkn14DvPmTwP85dKjy9Jc2ItaLPDWhFE6e5OpuuctWlrFf9kKDlXhw/HOILRzZB4=
X-Gm-Gg: ASbGnct8L9bxby7gqqIgH1eIFCShb4xN8O8YbXUpZ0x1ly4PqbNe4zxwbX9FFYrD+Ua
	DJXjBc8RhO1pxg7GgVOQ/xDKaUKqPnlgnmhjwxGe+DB3yjQVnu53qwF0s5wW2W6P1VOy/5M7gyv
	5gJifQbQNRH3QzduDS0QLu+fMaSYS6PUW82HjGnJqq1ZL7/Ruo52JhcOV/hw7GY/x6NuecpAcCY
	mMaHzIUN/VLBZPG5Faavo6VlGyGwt47/4f5wGresxRZ5oREO60kpDVbrRrYbizYWYqkyNH04Be4
	04R+p4QKAxUw5YCU1b46McaawogaByptosafWv0wpTKR7ev3lsLRQpabe44LaDHb4FXU//YmyTl
	pcu9g1UtvOAQ6uqHrRrHqNrqNP7O8xzi6cTVyJBRVSRQfZmiJL8oZgvx84rVwHgp8E0RTpXZDVc
	7J
X-Google-Smtp-Source: AGHT+IGwvLf3ZgdUd4iAsN+CriZ8KUEaW9yxRhFdFBiIvi5V0uUTvjVhxvMH6yq504eeDgLltAEolQ==
X-Received: by 2002:a17:903:18d:b0:297:df99:6bd4 with SMTP id d9443c01a7336-29840842cb3mr12574055ad.18.1762816557960;
        Mon, 10 Nov 2025 15:15:57 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29836cce339sm25144965ad.59.2025.11.10.15.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 15:15:57 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 34C6A4206925; Tue, 11 Nov 2025 06:15:55 +0700 (WIB)
Date: Tue, 11 Nov 2025 06:15:54 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux ARM MSM <linux-arm-msm@vger.kernel.org>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
	Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
	Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
	Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
	Aswin Venkatesan <aswivenk@qti.qualcomm.com>
Subject: Re: [PATCH 0/2] accel/qaic documentation fixes
Message-ID: <aRJyKlRkihq1OcGk@archie.me>
References: <20251110035952.25778-2-bagasdotme@gmail.com>
 <e44c8f40-b6ff-4369-8d86-ded225b41544@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e44c8f40-b6ff-4369-8d86-ded225b41544@oss.qualcomm.com>

On Mon, Nov 10, 2025 at 11:54:59AM -0700, Jeff Hugo wrote:
> Thank you for the fixes. Yet again I am impressed by having your fixes in my
> inbox before I even see the reports.
> 
> I'll get these merged to drm-misc-next where the offending issues currently
> reside.  I anticipate getting that done later today.

Thank you for the compliment!

-- 
An old man doll... just what I always wanted! - Clara
