Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA38D32E14C
	for <linux-doc@vger.kernel.org>; Fri,  6 Feb 2026 09:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770369578; cv=none; b=p4vZqcLUKST1izs1QnTtXPsx/q91sjLkyTeLQ7/r2KIiWH/sLn5rr7tXxpq33eA4WqgItwQfAS3lIygzycP56dwttW/mBopQnsRN8iXh4S8n08w5vdrW19LMthPXvTwNdz8k8Z0CXWtS9CHr3dD7nj3Lhx6aiEmddP56eD1Hxy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770369578; c=relaxed/simple;
	bh=NOjMrvXLnxubIJ98sxIqIaFk16kAXp6BZ67WoBvZ684=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lwd/234q7wNjzzAa8G2CiMRSFv+dw4plybKxh50xRx6pdDf8pv2WT+YBQjnFosCWocRcXDICD4ySgdrLbRC3RQi5tEgeqqq3NFNRU439AFbqNOIgy2/D+SCe7n28wkJpf+vcsDrQ6cOXLe0ZVuNHvvweC5Bh2GO2o1bC+j35oE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=tGNdjA6m; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="tGNdjA6m"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-482f454be5bso23616765e9.0
        for <linux-doc@vger.kernel.org>; Fri, 06 Feb 2026 01:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770369575; x=1770974375; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NOjMrvXLnxubIJ98sxIqIaFk16kAXp6BZ67WoBvZ684=;
        b=tGNdjA6mjSn1RcZh6sOY3d4GJU3BT5sSZ4BcgHgairWhCv0eS3vXcD0Dbehjh78ipl
         618Qfv1FxWjfvqsVZdaSy+/sUzOznx5sLmRNyBVeVHYSxUBgmrMoCsvkeAhqJyfYf9Bg
         ZR7bRpPHQ7jKNsmueVoWYDPb1Aiom9Fw52D3OBLbV01fCoc6ok5WZtJGyMbvf9YcVOVI
         4WJf1GPk9XMeAzFtTXWzph+9XDoGYOtEj1rq6hR3f9fFhcpoKCdKcXJ9/37MWPZY5/+1
         tuLDrmhBR//mGNosouBCLR7dFeEJDwDUxwN4ost0VDE/aFBaiQIxladGo/WiQhgJI2Pu
         uz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770369575; x=1770974375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NOjMrvXLnxubIJ98sxIqIaFk16kAXp6BZ67WoBvZ684=;
        b=c3AvZGbfJGKMs3OFJzBwTYBUZQ0hefi7fc+ELb9f9FQ+S4jDTPxVvyVvE0P1dpjsXs
         Eo3XRexKhQh+ri9eKr2GU+MKnhyKGtD9E6ids403XTUhsd/KMCC6tSwm6fAyPjJpUerm
         bbItUbKgUg49Vj2HG/0BQEy4ShuM6pDOqBqhck13MdBp05q0tMGKRhwKIeNJyVVvIaK1
         ngREF17FaFktYOcOLnjGVPnanH/W4SZ+QQnzrjC6CgEzhhkwYzsORo02aVRSGO8CrQ1T
         qowa5agFTPsYha3RcmaLfHkItzWkfSicaTMxhupJMIjwqwl8xg6h3rIZ+DF3zua73NoZ
         Xjzw==
X-Forwarded-Encrypted: i=1; AJvYcCX4rJVmdxb2XKNiAHSPqhVUE1aB60I/a8QR3pmXOkNtJ7tFt6w0u2Oik28tCyHTeHjEufls0XAhpqo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ1442wsw2wxu17hHFmyX2nWce4BsQRcJtzsbv1if6jwad6QoA
	5VTuM15OVW026J0yNrZtWmS84Fq3BpSyab8xZs5/bZmE5/vd/eKR4c8277CmKufggds=
X-Gm-Gg: AZuq6aLTcNMhFr+9HrlY883VnJK+i/RrGcm0A6280DJ7SHfdq1vqR2Rbv8+nskRC4S5
	vDCDq7cmJdfl4e4m9IAfoqaJ2fPnYtuY0rOF/tQjf/gV8XkfwhwTkeqFDAZ23jvblHNeoYTG8ms
	z7r345x4J5/LVTattlRiLE7qqgTlQ5X9tWPDXxcmZ21QrAtOsP7nbEjPDTU1N92bdwK+XSc2BB5
	oOLlUcJBWoWlWvQdF2wVgQy1KqWjk03ILWqDEHp77lo3kUsQ5Y4T3ijLEcPzd5ggnjLI9e4iXJT
	IFnojR/iYxqyiDmXlZHHiI1e0VWJoW+u1b/Dw+chJViIT6WLqk+VmmYqGl6Yma823P82ZE3FXms
	8m7OAneahkSjsfMvz++Ryb7peYlQYlOSxqdFjKO4+PETMwwj8e5I+tZDc1/Nyl6gNP/9c8JE6RH
	5Z7YA3SV+QYTsszq0YW7o=
X-Received: by 2002:a7b:c3d5:0:b0:47e:e38b:a83 with SMTP id 5b1f17b1804b1-483178ebf8emr52443975e9.7.1770369574701;
        Fri, 06 Feb 2026 01:19:34 -0800 (PST)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d8e8d4sm112369355e9.15.2026.02.06.01.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 01:19:33 -0800 (PST)
Date: Fri, 6 Feb 2026 10:19:30 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Tariq Toukan <tariqt@nvidia.com>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Donald Hunter <donald.hunter@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>, Shuah Khan <shuah@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-kselftest@vger.kernel.org, Gal Pressman <gal@nvidia.com>, 
	Moshe Shemesh <moshe@nvidia.com>, Shay Drori <shayd@nvidia.com>, Jiri Pirko <jiri@nvidia.com>, 
	Or Har-Toov <ohartoov@nvidia.com>
Subject: Re: [PATCH net-next V2 1/7] devlink: Refactor resource functions to
 be generic
Message-ID: <f56e4xngd6byd5gta2hcvfzwwntqbybpbbqv3nw2i7734cc5kx@vwaqvacwxiyp>
References: <20260205142833.1727929-1-tariqt@nvidia.com>
 <20260205142833.1727929-2-tariqt@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205142833.1727929-2-tariqt@nvidia.com>

Thu, Feb 05, 2026 at 03:28:27PM +0100, tariqt@nvidia.com wrote:
>From: Or Har-Toov <ohartoov@nvidia.com>
>
>Currently the resource functions take devlink pointer as parameter
>and take the resource list from there.
>Allows the resource functions to work with other resource lists

s/Allows/Allow/ ?


>that will be added in next patches and not only with the devlink's
>resource list.
>
>Signed-off-by: Or Har-Toov <ohartoov@nvidia.com>
>Reviewed-by: Shay Drori <shayd@nvidia.com>
>Signed-off-by: Tariq Toukan <tariqt@nvidia.com>

Otherwise, the code looks fine to me:

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
