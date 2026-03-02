Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5807D548EE
	for <linux-doc@vger.kernel.org>; Mon,  2 Mar 2026 09:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772443857; cv=none; b=XEJ483U2ASFSDZJbckqJBPCHWcDOB47C6BDU8q/WnYx9e8Pw+pqVEeMWdMpOCGnvHGvhItHgcZhiU86dyGIDmMfHnt2xpP0GJ899VIjAkVJlwHM02nvKjoOi5FfQnoYUa0JrpuUg2G9C4jACs9Vk5mwwLwX9KJD/4ZReLWYAIYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772443857; c=relaxed/simple;
	bh=SkQS32P2isxsZzN0Tpf5AFFSNZCHU5H1VsWyGV3O950=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C+JxwhkT9/lCa9lSNxOzPiJlh7tE971pRJECVJlkkUWZ1XvSaFCQmnqrMu01Amx0XCS31MqdZRjzfdePZOnZx2UY0s5RE28lsWAjs4DAqToE8MLc2RKSHy5tUfusMTA28RYRM52zf9Gu/7c07z9WpmZebnUaJXrDmXijddzdJYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=xxCY8N+f; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="xxCY8N+f"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439b9b190easo285923f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 02 Mar 2026 01:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1772443855; x=1773048655; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9G+3cg9egGGuETeZt9ogez9f+d5U3nrYRpciNbV9ROE=;
        b=xxCY8N+fbsjMfrshhj4gYM+chOalJaRweaJrL2wTpoGwmLZlUbumL7awGab7yxbwRV
         0mUaxq4c7qj1jSTnk3EAuIK6lSDxxdADCvoZL53octj513wTDSnRi4/R5cdaOh0EHvX4
         DGk6gTh2QKF990FGOy3pDqZQXPQ4Eyp2TM2CNZXQXLZShRMd//Y2twlzATk7O5n9oQev
         vkpPyzwkB82N5P/erQPzm165G7oovxqcTaqbSTAprF205+73zG3jdrNDP9/h9iAZcnG6
         GEwT8qqD5tqVlJ8g2KjgdD0phbqxtqX6t2w5BM7ieSuIOuD9fLRS9AwTGY2Sghwz6Dno
         c4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772443855; x=1773048655;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9G+3cg9egGGuETeZt9ogez9f+d5U3nrYRpciNbV9ROE=;
        b=Ygx1sVSUfw6vmsoisE9B9rDLtKJ0LjoEtE++GIEZ3ikCZhwtIVU0GzStyiSaBugL9C
         kAc3a4sF4hHCs8hiQI/2mn9xUbZYES9OyxW5niqL93Y0GS4GqarlX9bfOssA0g7MTcZM
         ffNvvTwXBhXEjWj0M7Qr0rFU+VgwuWhfUQ0YYoove3HWssPeoqvNpwZja6Vru/zOFXyU
         qbwU4/mNcBu4a5hjGxKQmvsa4k9T/jiX5GmCe2CVw11jRWcuFUcfXAtqfP9u1/ruVeU1
         UcSJYFcB6yl4Pp+pMBSB4VSZxK6VU7yVilVvAkINPIuskIx/cfrbmP6V3aFjJM7wAVWX
         5aOg==
X-Forwarded-Encrypted: i=1; AJvYcCXq+rekzqZIwXQ7f7SNrLJTOpbdwZXdz3qOsKVZfT2tbM/Diu7743AOPoU09daDj2ffExG8WcmmTGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzQb++0GsC/qbB+e4zqAqfC0a7+56Jo7Qxd24GgkRUfRXkAIF+
	JJsGA5qlOMvY85wYWC/MUwSQrGobTnWOtAJMURyQT5+9HUhyRxXlNy0JOIa9wOljitM=
X-Gm-Gg: ATEYQzz6KC0exHi4g/OGozzoCk3eMthMysSSSetOUAK98IHOjGLtpgvWsnOgqxjFjC6
	ZCgiFbnHhQKN7cvNwxlagfikS3nE2lsNgA8qsr9Si7d9MCb2QlR9spv6l6DGnlxQyBdZRjfUsxe
	FS9EXD6pTVJw2uMDg0j9Q+uIfUuiNTm/eFWVcjgDzMMluJ9743xqLeS6dPy7Z866NgMEDmOznEC
	SQDF4tPIWB4jVDgg4Ln6EBp/ULhG6KGejhq7h8C+kYZAitKydOE7KAI2Xon4dpFi+2tXafUtPqX
	9XckOZ5+bWp1o3mb42b+NqGbuzgXx/7qI1Dboe6O040E83kSTaptbfd7y6r0jEh4J2duKZgu/iH
	aCuVS2DI3YwJqG/kmzGkRDzwEmA6hUz4e1pHH3WScvRl1XUcdtbmscyXv8JyKSoSw7KkuxY1zO1
	m99Sfc88TZz6xTdoAo5OA2kS9/i/KYbO0=
X-Received: by 2002:a05:6000:601:b0:439:9550:fc57 with SMTP id ffacd0b85a97d-4399dde551dmr19370651f8f.18.1772443854545;
        Mon, 02 Mar 2026 01:30:54 -0800 (PST)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439abdf5430sm15422817f8f.5.2026.03.02.01.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 01:30:54 -0800 (PST)
Date: Mon, 2 Mar 2026 10:30:51 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, horms@kernel.org, donald.hunter@gmail.com, corbet@lwn.net, 
	skhan@linuxfoundation.org, saeedm@nvidia.com, leon@kernel.org, tariqt@nvidia.com, 
	mbloch@nvidia.com, przemyslaw.kitszel@intel.com, mschmidt@redhat.com, 
	andrew+netdev@lunn.ch, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, chuck.lever@oracle.com, matttbe@kernel.org, cjubran@nvidia.com, 
	daniel.zahka@gmail.com, linux-doc@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 08/10] devlink: introduce shared devlink
 instance for PFs on same chip
Message-ID: <cic5snbhrc4lvs5iyuddepj66nyttzpajgcjal4etqebjxlgqo@hwwtlbmczhr6>
References: <20260225133422.290965-1-jiri@resnulli.us>
 <20260225133422.290965-9-jiri@resnulli.us>
 <20260228150311.1a1ded74@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228150311.1a1ded74@kernel.org>

Sun, Mar 01, 2026 at 12:03:11AM +0100, kuba@kernel.org wrote:
>On Wed, 25 Feb 2026 14:34:20 +0100 Jiri Pirko wrote:
>> +struct devlink_shd {
>> +	struct list_head list; /* Node in shd list */
>> +	const char *id; /* Identifier string (e.g., serial number) */
>> +	refcount_t refcount; /* Reference count */
>> +	char priv[] __aligned(NETDEV_ALIGN); /* Driver private data */
>> +};
>
>As pointed out by AI you promised a size member and a __counted_by()
>annotation :)

Yeah, somehow I got false impression this is not needed for priv. My
bad, sorry, adding it.
