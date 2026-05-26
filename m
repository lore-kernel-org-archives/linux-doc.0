Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81DE3CBE79
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 07:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779781500; cv=none; b=YcGotAMXohrHC/HYpHyGsPtKwGxWRi+Ok3GR8WEHKbXq5kE0PsJW/HsNYZo5KxVAT5MBCGXNLRwE3/13E15L7HeiOqb+HcGga+LPnen29m6KF63tvI7kkaAJcGAMSRWFW5g/W6vbey0ry09JBT/fYqUShFlBBbXNlN3CLivZs8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779781500; c=relaxed/simple;
	bh=HOIrj5sgGXq3c+j31QIdduCco4yj8GtAwZ85IMokvdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJTqD3aFAjQhdkw77/u4cvY/Xu+gsaO6ge/LtAOlw1MhmQ6OlmLh5bgIgYxiHC+cVmQeLTLyzZe7jqfYaOa67wzN+knmGLQmc3v7zC3svrVWlglLebvS2L/6XTIIPrrKlEhk2T7HtgaAf7yahHyWnSj/MIdHH/HsBNvlExLBnyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=B62lJTWu; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="B62lJTWu"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43fe608cb92so6203416f8f.2
        for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 00:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1779781496; x=1780386296; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=meQXJPGH/eSRep/h9BO6zFwy/e970wDOwhGQTQCudGw=;
        b=B62lJTWuXw+j/rjl9d2vdf1PQlB9LhWCYyJSGP0OmkcmwHP1rhVO+nWHNWBvbNCtYU
         v9A6vmaZFI40/kj4kFl5egR8L8rB583INKQej7us+23x7TyhHxOrGdjUJrkT8SOqpDoI
         4yN4bCFicyf1jr7wOwCt3Gj2RE2peSDCn0wU8a7xy3QpkschwG0StKQW81ho/GMtVqQf
         4DpI38GAl/ezkfJ6FcaOvzC3K2O7S2MYOHYnqq3VNvTsoM3O9A14YhucDRkSJmCQl6Ie
         ExNH4kCGxdcZBqfmfrKzGCWJ570e/WpI2SPUGv5VnJ1t1gl0FtMJsgWRc+EV2bGhkq1Y
         vAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779781496; x=1780386296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=meQXJPGH/eSRep/h9BO6zFwy/e970wDOwhGQTQCudGw=;
        b=tPhKEnsiqb3gggA3pdxTF+sA1ne5/W1UzVzi+K+eKTKtX7YARXHMFO+KZdeDqpqTL/
         phYhPlSkglTOVTB8k+NW914ITSFKU15pRDCGgNTzN97V3JXSobg5Kk5QiL1YZ5eNj0BY
         AEU48387VvfGOPje3O9AsyaB02y7MxcyM3tb2g7ubVjeOt/e57qWCQOmaOR6y5vfB0by
         Wywfd57m9rxTvQesF9KmVpVotiWfoBLcJRbUSVaEP7dXkV+CWZaemXgt3ihjpLpPFReb
         47p6YleJjdjoCl93Y9c0k2oGnOiGAl9/S6JJdCeYfD1I9P1twi2tCuXMzhXo0B0TBJHz
         GVPw==
X-Forwarded-Encrypted: i=1; AFNElJ/25/SqIyaGrnVeKn+UUicp6NzHqC6RqWATBctmV0gycOmWX/6aY5GDGxczk9VKJc7GRJQvpwQmp9o=@vger.kernel.org
X-Gm-Message-State: AOJu0YywuWKYpa4OGurINyicy72oXJ+eWlPksU4R5J/qmH6pQvjtPvfC
	DBrkQlV7HRGbU5X9WvpXJYwPjXrN6Rk4xw7r7bx2idf1YtLT9PKdJ9fgBExHWzwRz2g=
X-Gm-Gg: Acq92OG/XefVjoFWXdseK0FxsjDYGTtLLHS3Num9P3gZj8HX+5c4YRIsfu4CwuJWIMH
	NSTcbM/2gvLQJ8nXnGkvu4OLO30Z6ErEJvZkndSu8Z38f9XCm+Csd4W61pbuba6hVy/b46xMmR6
	TbXKFv/TCF7n4f3B6vXtwB9IdLNOHYEj3p866bTiIQ6l8rnNPSiggSRaGXBbiLXvYIsiIp05MJQ
	4wAl/99eVlN+igwFTfkjX50Jj+0rfn6SCDfatF89NbacrKI1oSz1TIbvgVeXc9BfDAH2Ba6NzrZ
	Xm84ileqB+JH2YE9tYpjiRvqZ7Ri5XhCNqy1RCAQ3NHzdKyMwaqURhAVdoya87Tz2QT2We3QK/u
	4DGmYblJkjOnUKyHyZW+IgVD0zk4BIGxo+4/uUKy/LoSGiLIt/Sftet/1g+O6aQaDAR1EOeewBm
	9V7agj7OO8IwKaOFVsjgl/zyJGK+X6rtZD
X-Received: by 2002:a05:6000:1a87:b0:43f:dd91:b022 with SMTP id ffacd0b85a97d-45eb38d7d0emr29705304f8f.35.1779781496236;
        Tue, 26 May 2026 00:44:56 -0700 (PDT)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6cd151asm32668426f8f.13.2026.05.26.00.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 00:44:55 -0700 (PDT)
Date: Tue, 26 May 2026 09:44:52 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Tariq Toukan <tariqt@nvidia.com>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Simon Horman <horms@kernel.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
	Mark Bloch <mbloch@nvidia.com>, "Borislav Petkov (AMD)" <bp@alien8.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Petr Mladek <pmladek@suse.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Tejun Heo <tj@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Feng Tang <feng.tang@linux.alibaba.com>, Christian Brauner <brauner@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Kees Cook <kees@kernel.org>, Marco Elver <elver@google.com>, 
	Li RongQing <lirongqing@baidu.com>, Eric Biggers <ebiggers@kernel.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-rdma@vger.kernel.org, Gal Pressman <gal@nvidia.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, Jiri Pirko <jiri@nvidia.com>, Shay Drori <shayd@nvidia.com>, 
	Moshe Shemesh <moshe@nvidia.com>
Subject: Re: [PATCH net-next 3/3] net/mlx5: Apply devlink default eswitch
 mode during init
Message-ID: <ahVPASuh4BZGOfx0@FV6GYCPJ69>
References: <20260521072434.362624-1-tariqt@nvidia.com>
 <20260521072434.362624-4-tariqt@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521072434.362624-4-tariqt@nvidia.com>

Thu, May 21, 2026 at 09:24:34AM +0200, tariqt@nvidia.com wrote:
>From: Mark Bloch <mbloch@nvidia.com>
>
>Apply devlink default eswitch mode for mlx5 devices after successful
>device initialization while holding the devlink instance lock.
>
>At this point the devlink instance is registered and the mlx5 devlink
>operations are available, so the default eswitch mode can be applied to
>the matching PCI devlink handle.
>
>Signed-off-by: Mark Bloch <mbloch@nvidia.com>
>Reviewed-by: Shay Drori <shayd@nvidia.com>
>Reviewed-by: Moshe Shemesh <moshe@nvidia.com>
>Signed-off-by: Tariq Toukan <tariqt@nvidia.com>
>---
> drivers/net/ethernet/mellanox/mlx5/core/main.c | 17 +++++++++++++++++
> 1 file changed, 17 insertions(+)
>
>diff --git a/drivers/net/ethernet/mellanox/mlx5/core/main.c b/drivers/net/ethernet/mellanox/mlx5/core/main.c
>index 0c6e4efe38c8..4528097f3d84 100644
>--- a/drivers/net/ethernet/mellanox/mlx5/core/main.c
>+++ b/drivers/net/ethernet/mellanox/mlx5/core/main.c
>@@ -1391,6 +1391,21 @@ static void mlx5_unload(struct mlx5_core_dev *dev)
> 	mlx5_free_bfreg(dev, &dev->priv.bfreg);
> }
> 
>+static void mlx5_devl_apply_default_esw_mode(struct mlx5_core_dev *dev)
>+{
>+	struct devlink *devlink = priv_to_devlink(dev);
>+	int err;
>+
>+	if (!MLX5_ESWITCH_MANAGER(dev))
>+		return;
>+
>+	devl_assert_locked(devlink);
>+	err = devl_apply_default_esw_mode(devlink);
>+	if (err)
>+		mlx5_core_warn(dev, "Couldn't apply default eswitch mode, err %d\n",
>+			       err);
>+}
>+
> int mlx5_init_one_devl_locked(struct mlx5_core_dev *dev)
> {
> 	bool light_probe = mlx5_dev_is_lightweight(dev);
>@@ -1437,6 +1452,7 @@ int mlx5_init_one_devl_locked(struct mlx5_core_dev *dev)
> 		mlx5_core_err(dev, "mlx5_hwmon_dev_register failed with error code %d\n", err);
> 
> 	mutex_unlock(&dev->intf_state_mutex);
>+	mlx5_devl_apply_default_esw_mode(dev);

I wonder how we can make this work for all. I mean, other driver would
silently ignore this command like arg, right? Any idea how to make all
drivers follow the arg from very beginning?


> 	return 0;
> 
> err_register:
>@@ -1538,6 +1554,7 @@ int mlx5_load_one_devl_locked(struct mlx5_core_dev *dev, bool recovery)
> 		goto err_attach;
> 
> 	mutex_unlock(&dev->intf_state_mutex);
>+	mlx5_devl_apply_default_esw_mode(dev);
> 	return 0;
> 
> err_attach:
>-- 
>2.44.0
>
