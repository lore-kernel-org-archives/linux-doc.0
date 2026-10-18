Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5843F36196E
	for <linux-doc@vger.kernel.org>; Sun, 18 Oct 2026 16:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792341088; cv=none; b=I/+OiI0rAEUQQfnRBRz5CwvNX3cNTHjoc5ZwBqOLCqMILHQzVvoYRrtj66Ks94Y0rE+8izfiVn1FheNshtLmhFonLomZwtsWCsduFdN0DzSa4l3zQRwPtaFFHxGaBhAM6tbDBAvLumOxyc9mmvhQKm7Qxmc7hZax8X0eGq8pTpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792341088; c=relaxed/simple;
	bh=au8Gvd6+WEU8zV/daAfKj+L+yF0iVWqrpQqPfGml9hk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQVMEEPjm39Npysy6UE7V1624qBgi26bup6J6yOV4xAtpqVyc0NkrEaky43NJsQxV1xVuIihxZ9WRwiLPyZxVJ/vQDAWat/PsfLyzBeFNJBaCE/nU8Vd9+FUMzev3AGlVlqM2sl3SBocY12bQA2omf1/LKjyS5mzUfTbKCfDIO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K68T5dXo; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K68T5dXo"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so706547a12.1
        for <linux-doc@vger.kernel.org>; Sun, 18 Oct 2026 09:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792341087; x=1792945887; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WhZ6HkRzC6hmWIpP7WOwdVZqWzvDpVWCEpyfcLFKaWA=;
        b=K68T5dXoYJ4LB0dffdYrHGl8E09ixEURtKBRxGfRCzYSoQHua7ORO28K/S7uhmvK+R
         zNBDpAe2SaEqzJLKwXS1qlnBmKARmCMW5Epw3uBTrErM31vIYbnArkeqyuV4ntlBzenA
         mog7uzYm1Ua39+NUkd6QDzxNowI3ZC0r64gNMqKA1cCuqFb/k/BUlxvuauCULT/7h4mM
         DKs/bs5jpJ/A6rsrr6x6mTcvjmFU/LvddoxIH7aZkY5DYRsNqtDtfO0JlsSz1kFkNGIn
         P5bFPR9ZGWHdUAuR+jpw6OjE4987B9USltJeCtJlmWMQCz3pybLkKBrCfqzdUE93wkvC
         2Mdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792341087; x=1792945887;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WhZ6HkRzC6hmWIpP7WOwdVZqWzvDpVWCEpyfcLFKaWA=;
        b=Reeqzd8c5A4qb9ly9NvcWCyHA4Gp5EpePsh+rxU/IXN1atudvdRhlUT//QFGxEEPwU
         A2jP26WW6kTUOQOxeMZjAhTQmWE/f5LTrsSZ8qaintrzgCtse5PVqwocdl7sn2yz5NDy
         +FT9qCwpHAfRVn0RPBdoL2hftfqonONXL9O4ZEtASq1qGz7UXzBkJDIFlBYDhYPz+CQc
         i/iG+1ILI32QxXIyoB53mq3WNgZT+VgafDYD5ypvx7EPVVOPUq1J0yxDTpdX9HsP/3Wb
         pstQkuLDSt7oSO1aM/AE9bphFJsLqDSKsCEgzyr568udxd3GHQhX+KiNo84g9Nt4rZLV
         vsfQ==
X-Forwarded-Encrypted: i=1; AKwUvBykjSUmB59bFggbWUrbGq67coiYyFNJMFUV5O0BSXckCu4uMUSd4m1b6d/GoI+N3+7Dy5biN4E8Xls=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzDDchb/toIKGT7WHKvfQBaBYneNVej6NwrMQMfwxWMz1lL96k
	94icjc6BqmzEZ6igYV6AMRxR1SVxSq4RFvihKA6auPJ4SsE6kabb5Eah
X-Gm-Gg: AYBFou0zgBRZCihsYhIc5fs6auKfkCCQM9aBypczswz9XnFMlnNcd+nAvmp8PZOozYp
	AvCADXFhBNDlXPWO5wodkoxeXv8mJg0F/pqGRmvu34MCz5wnPcWO1S/NlaS7vVXvNbcqn1Q4Itq
	W9i36NSYQZRXcW6+BT6rEwEgREB5z9jxmnpnMkXfoTnpUL0tAauwW9KdBIJvQRT2CoYGw5dk/0C
	eV8COuwU0xYRjiJM+a5wEAIefi735lMbAR8jCyf6Qkc0Qc1vhSIKGZIi51dZjMmIZWxxgAgeOX8
	wGw9PwUH53yBnGDCD5sNux+BQMHtelr1YTf8rpYfSr7E5RZ8qEV42RsZz4bId7S3Ja5I9dGDDYC
	zmwaaymMicLwuEzMUoRzGT8de4zLk8UHN1AdvMgAWsJya11WE3nWeBbGS7JejvBSPPVgsv91/V6
	g3Y16xWouBbqp804BkdEtE9uh8MDNAazWf/Wp49CrPSj25tETzOYQ/YY4SzwcaONw6gnoat4fv/
	xjJP4BBP/MjPnYBz4Ir+sI=
X-Received: by 2002:a05:6a20:43ac:b0:3de:7f6c:b871 with SMTP id adf61e73a8af0-3e22607ded2mr3605547637.36.1792341086646;
        Sun, 18 Oct 2026 09:31:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89fd2737d20sm2611477b3a.35.2026.10.18.09.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:31:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 18 Oct 2026 09:31:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Qian Xiao <heyheyco@gmail.com>
Cc: Ed Brindley <kernel@maidavale.org>, Denis Pauk <pauk.denis@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (asus_wmi_sensors) Reword BIOS upgrade advice
Message-ID: <08bd0bd3-a80f-41bd-a057-208da8e823cd@roeck-us.net>
References: <20261016163509.249020-1-heyheyco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016163509.249020-1-heyheyco@gmail.com>

On Fri, Oct 16, 2026 at 09:35:08AM -0700, Qian Xiao wrote:
> The Known Issues section suggests that upgrading to a BIOS with WMI
> method version two or greater should rectify the problem. However, the
> driver refuses to bind when the BIOS reports a version below two, so
> every system using the driver already meets that condition and the
> advice does not help.
> 
> Instead, suggest that upgrading to a more recent BIOS version might
> help. While at it, fix a typo in the preceding sentence.
> 
> Link: https://lore.kernel.org/linux-hwmon/CAFGXJCm6ZWK0NsFhZ1_ycgYtTTT3nhqj9mose60t+Rrry1aPvw@mail.gmail.com/
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Qian Xiao <heyheyco@gmail.com>

Applied.

Thanks,
Guenter
