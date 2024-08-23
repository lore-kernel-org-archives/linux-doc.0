Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98836144D0A
	for <linux-doc@vger.kernel.org>; Fri, 23 Aug 2024 08:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724402418; cv=none; b=ESmYtYOx8WnrcR/IhKDKRi8sLHE/0zh1+GL0vv+Y651T5o2ogxxHViyPTHIjj6DxuOya3Eey9LVaUMpAuErSUjv7yMfKYhLqqnZ+WbLu6Ir37kvyjj6U8uNxbxR9UG5c0f1Ii73czTx96JJoC7+hzapwlbCziTt3SxYuQhvPqyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724402418; c=relaxed/simple;
	bh=/gkKdkn1kch9YHgvbfB4pJh7hu8uTpCucVk4jPgCW2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J5XG3fsEJ7b1C+fyWQqWZlFuOYAJBX5SkBhpzhYKVJQjxgxd+xA3Qm162ntqRtPHIhPVjkJatIElp5GfQhBErTJe17YRd1X1Lk8Nm3IFidHN7ZN1od3rZ6lVU/nr/ah2ycaZbxQGTabSaRXrudltEmpOzMXxoTtTz/Dhl+uNo64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=pgQv9t36; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="pgQv9t36"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5bec87ececeso2158298a12.0
        for <linux-doc@vger.kernel.org>; Fri, 23 Aug 2024 01:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1724402415; x=1725007215; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/gkKdkn1kch9YHgvbfB4pJh7hu8uTpCucVk4jPgCW2M=;
        b=pgQv9t36FhrDOoXSd3BMXJ756sNDTzu3RHAkuG+hrV4EQCc9z5mglilHHvBzDHRvf1
         Q3oiN8RIWYuSmS6w+Ji/ntWe6AYVlWHU+oM5z2rOWixjV/1PhylKbD7eSwU1acbfxtuJ
         SHLsaNYUqe46Id/A4TLcKp8gpL9ET6Kg08NzFs0o8jDQzTd4zU/fIjdiOWG0G2Fapi+b
         q59NnLQEYbKCLCjoHmN8HU/lLRXUg9ckjdqW5Gx0ZPhJkYAQXcRwJfQyh0C136TyLu70
         6XbsA21pe5aLWcrOdm+C74skr9bu1gz61ro1ypkYhqyiBvlJq8+lxOXv+GktIMOwExDd
         6b9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724402415; x=1725007215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/gkKdkn1kch9YHgvbfB4pJh7hu8uTpCucVk4jPgCW2M=;
        b=AVM4Miac0zZh0Gm2y9V26cw+MY1F+m9mrP6jEzpbfwFGu+p4342fxqw3d/kN6MGUy4
         Pfv+pS7TGr+2BHzVDQ7uA3LR49hLxHDFCbp83eP7qmcVNOAw0kyRSYZs4ANNpjVMrCKQ
         cuGyKUbAQ7LTPEZT+/Jqli4Bi5A4CgvT0YDbIQnt1pYn3uUFMalsBWO21qIF0ope7oBr
         z+XyaqhUhxqlxki/QKFdtJCzow+Vo2+aont7ZaL9VUc77RVRvD6yopAFwVCJnEu82WUi
         CL+UbEqDksnt4WR8JMy3jJGZvhsPCvlt+c3wMMLTlB4NJL0uvnZqJql+kzJRqMvO9RX8
         WCJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOmhItnqKVh2Qn5SCVyQzJofchP39RLzlO/zOFSldVyX+5fGRS20+2PK8HY1zQRLh3Bf89hulaajA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzDm4cSd71Y+KVG/Ni3Yi1eEchFCl45YPuIp2EU0zSnYJNqPcp
	eG2zQVTdqur0Zfuqbor3R7BEK460Ps1Fr8ZuN9atjL1Qis4MM02hv/F4d6/x1bI=
X-Google-Smtp-Source: AGHT+IGaPZGfsEcdpD0z2HooWb5CW/e+RVLq6gXdB73IpyHPSTkCKbWsNG2C5VF/YTe9NZwWRUVqtg==
X-Received: by 2002:a17:907:7e95:b0:a86:668d:c0b2 with SMTP id a640c23a62f3a-a86a5189298mr133154366b.7.1724402414734;
        Fri, 23 Aug 2024 01:40:14 -0700 (PDT)
Received: from localhost (37-48-50-18.nat.epc.tmcz.cz. [37.48.50.18])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f220324sm229420666b.44.2024.08.23.01.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 01:40:14 -0700 (PDT)
Date: Fri, 23 Aug 2024 10:40:13 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc: netdev@vger.kernel.org, vadim.fedorenko@linux.dev, corbet@lwn.net,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, donald.hunter@gmail.com,
	anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com,
	intel-wired-lan@lists.osuosl.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Subject: Re: [PATCH net-next v3 2/2] ice: add callbacks for Embedded SYNC
 enablement on dpll pins
Message-ID: <ZshK7RwzHO_vZtdN@nanopsycho.orion>
References: <20240822222513.255179-1-arkadiusz.kubalewski@intel.com>
 <20240822222513.255179-3-arkadiusz.kubalewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822222513.255179-3-arkadiusz.kubalewski@intel.com>

Fri, Aug 23, 2024 at 12:25:13AM CEST, arkadiusz.kubalewski@intel.com wrote:
>Allow the user to get and set configuration of Embedded SYNC feature
>on the ice driver dpll pins.
>
>Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
>Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
