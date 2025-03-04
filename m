Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151D527CCFF
	for <linux-doc@vger.kernel.org>; Tue,  4 Mar 2025 15:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741103467; cv=none; b=dFzAdF9Sn+aATAVHTiCA+xA1uiu2p17J6YkDr/G5labJHSbEyDHXTY6iB/QAOvZucIoZ3mMH+nRoxu6tO8TC9kzwF1KO08an+2KfECENGvmcjizqK/u95zFgIyw2flnsBQ6BpwtOCoMfs0pq33yUSIJCJS9/NLKZ8nUIHuSn8EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741103467; c=relaxed/simple;
	bh=k2Y27E8jBe6v83yy6OVDayltip9TmWM0y/2df87N2Wk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J384eThKwbrqiZuRd+Rhp06+yCodOWNemPO0sLNG4tqy9++657YYFoEXeukq0COFaE26pFzV6TzIzOnqLkt4xlhZSqPi7S2BmP7yYK3dwS5tXct+Sc81wzmFomx7fZqsTvIi7yLR0zPiqhi2HZLxDfNQXNkZo0hCsoUwoGM+5Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FcZrEQom; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FcZrEQom"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-390f5556579so2350211f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 04 Mar 2025 07:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741103462; x=1741708262; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ztij9sovDefPZ+JmP5z7McxB3M6gtn8pxDpq2Itdo0g=;
        b=FcZrEQom3rzP6z093pcl2f9PYRpfDj2kSxp0utlBlAZ+tepjWwrw6vLG1mTMZ0tgq9
         9hwgdW6biG8yyR7qb3U12rJHyzhi8B4kCb0qU6zLp1pKkiAUv0Kbn1sE5E6CPVNgmML6
         glA0LJoCOSBnPckQtb548POvMBqHomz6SVXJR/xZ/qakb01gQ61mAtGPt5Hs8Vt8vUEx
         VtROY2f/2ZeDhmTwpbvCgc7USsNiBvFQl8doZlLrs0PEKgnGrPJwt7vlBuCJ9cypII6I
         Tjo08yc7D+CKnJ6RnrSwrAxLxi+t6QONXhlL/fLdaH6xOKzOu7BfEgJHKo5SHfwsq+mX
         RYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741103462; x=1741708262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ztij9sovDefPZ+JmP5z7McxB3M6gtn8pxDpq2Itdo0g=;
        b=qFLebx9nx6DKU3tyNJoVOr0pT3oBEG3JwxBQuq8mNHT1/kTFYCGcCix3H7XdOzDHuF
         li5fXweThRzT58mByAQcq+YYOHQXHdX8Qrvhfcuq1LxfQ9SCwvGhXvnyM15XODIlWYDW
         Ullp/kykY/V34hrv/8j5MGx3WTeiSk+78MVBHEFX4jd4wWhyZTgFEbsydexd6IMBHnwR
         fa3lfwkygGpjyCgG3FCHNySgaiRqRHBsyofsYyEGrE7k3EDGky6B/4+fCkYRkx04Kr+v
         nSdDVO9AsRb5HiYraLL+UvPthGz5vWn1VnLp4Qv6MMsyd7J05wmWaHq9yeIg1mdbCTx8
         lnrw==
X-Forwarded-Encrypted: i=1; AJvYcCUQCrx8h+ujooxUOb57OGmEFOqCcWtW6edgYNw8XDES4ZfjAivSyOYlpzh4fdsRZJzRgXwvlaEil5E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVE2ydmClGvuCZUo+x4D39AHk/6RMoIPxO3GyJyOO69Z+49tQT
	jz72Cj96s/0pZE7lP4WZber9Bm+EDqc/RoIbC3M9oKXYa0RDVqzQrD0zvXKHX4A=
X-Gm-Gg: ASbGnctKixa08+RUKK0cym8tdvsFmo5grxi2ITEPTxVLR6up6o6pnNTKJcgNIpsnArJ
	06oQEG7YpOzAy84D9ZpacyKiyXiB1N66X1R4AaLwoJHnuKLYWmaqlKwT1ULXBTYSQleNoXCqURY
	3orZGzIYJw6Nc+KWHbGp52k8kO0lTGRd2IN48o096IzvRGX4uSg/PZo+VxX6ZZJtuW/dbfDp70p
	VwXhEsT+LhrNE0wd0hvoXv2+aXHUDEInIqmaPzsldxDzs2G26vxFWQFS89g0V/rc2hMlOVyCa7r
	MbMuytATNvsdGF2JmHDJLJSWNv0loaluFw==
X-Google-Smtp-Source: AGHT+IEqw732r+HZ4NWu3JQYHrodjvDxnDB1NIugP9b50YqhrS6dPwVXDZpklzhnZ/WuAjHzoYGFCA==
X-Received: by 2002:a05:6000:418a:b0:38f:32a7:b6f3 with SMTP id ffacd0b85a97d-390eca41867mr11311863f8f.40.1741103462172;
        Tue, 04 Mar 2025 07:51:02 -0800 (PST)
Received: from pathway ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bb767a977sm99979765e9.18.2025.03.04.07.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 07:51:01 -0800 (PST)
Date: Tue, 4 Mar 2025 16:51:00 +0100
From: Petr Mladek <pmladek@suse.com>
To: Vincenzo MEZZELA <vincenzo.mezzela@suse.com>
Cc: live-patching@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, jpoimboe@kernel.org, jikos@kernel.org,
	mbenes@suse.cz, joe.lawrence@redhat.com, corbet@lwn.net
Subject: Re: [PATCH v2] docs: livepatch: move text out of code block
Message-ID: <Z8chZIpQkrp1GZhy@pathway>
References: <20250227163929.141053-1-vincenzo.mezzela@suse.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227163929.141053-1-vincenzo.mezzela@suse.com>

On Thu 2025-02-27 17:39:29, Vincenzo MEZZELA wrote:
> Part of the documentation text is included in the readelf output code
> block. Hence, split the code block and move the affected text outside.
> 
> Signed-off-by: Vincenzo MEZZELA <vincenzo.mezzela@suse.com>

JFYI, the patch has been comitted into livepatching.git,
branch for-6.15/trivial.

Best Regards,
Petr
