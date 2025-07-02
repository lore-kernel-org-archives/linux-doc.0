Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBAA254AF5
	for <linux-doc@vger.kernel.org>; Wed,  2 Jul 2025 10:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751451973; cv=none; b=ZTQQMrtXKSSKqb0DqZaip9koOuGXGbWJL+1gMbKZbW0qJmP+E/Z8k9tyfoJ492qAVstAm+hJXTi3Yd8eWdCnNQGdOFkUHjTrM0H41d7zkC235lpNLk3GV7++pPWC5byMhprwDvE851NReIL00unk1dCfC4lFfx4wLjsLe+zo1VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751451973; c=relaxed/simple;
	bh=A7Ag2M/xCPgnbM81/Ed1DfzL0YgWiPbRTDK/kNWLRz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pMzonNnZK+zc/QPvrqzsfMoBMRNowdiosQuiA7Xmfn+3xMYW7k0ZJZMqgHBXppnoAd+rq/hpZRQf6mkKmbDLJ0W27xd7VKDJN14xYqKaUG0J2s0H2+84eJRJRdVXjLtyL2bg0Ln2kvIn0HWGDBlNWXdhk1XjSLvmWZHV2MA/OAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=mGb7Bmlz; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="mGb7Bmlz"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-453066fad06so44949045e9.2
        for <linux-doc@vger.kernel.org>; Wed, 02 Jul 2025 03:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1751451970; x=1752056770; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yN3/Rce9O/Hh8jlflcA/tOl9nLaEQorrzHfucHxWn78=;
        b=mGb7Bmlz5/GUSD+zaFlQiXe4qbRmr+J7MCz76Kw6ja5yYPuwSBnB/0kEVLxM9abifM
         ZvwkBIcyzD5eaygzZdztn/QN0ZOkXhetgxNo3mn40WWpAEMsuj5Gx4pum/JA69pCOP2k
         +GBT5oJkj0Ga8rXxr1/6mpaGntuhSjAScFxktzwC0ZlhPeZbBNEQrwINQ62lKqXNTPjz
         ZMn3Uj664DcLFuZihjd3bZudbJTDgUAI8yYMrKTzIfsR3y3nyLzxygYfuFHlkUWGNT1e
         UTUuo4MtxoJg4rPu5IwfiMVDw8EOW1mbTyfXRUOAl78sp2DQ8m7MXAANO6C+MM6D3SIv
         NFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751451970; x=1752056770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yN3/Rce9O/Hh8jlflcA/tOl9nLaEQorrzHfucHxWn78=;
        b=QTTUyq0wOi8FrPuf4hkeX/bYVtyMYYOvATYHxhe5RJ4Kt5khtxfMdRN1xzzup6u7j0
         hpHZl3MSnhRMFbXXjX7bIK0ImPqbG8FlZj8QMceAkfpusJ4e5vKSg67JbHAOu9YXm6Mk
         gUrTp6l/100xjMKUVxNNCJS6dSoROOnU+3Gezxn7ypk5cGt9k9nmoXah1pSdxYDF/TYw
         CfJDynXKKBoZDbVqGOK4ugp+hL1aGRLv2bDG1/PPdKvyV8dGWfVV8KYzTJ802407t1gK
         86QUM/v7UmRBgd88TtWENdDw2Pj/4dya/lWNSb7yZj/s0byuBt89o9Zyc/AWZDaiQsn5
         js2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWEueIyWxLoVxLHUm76jzH0iGQZmfp1V9OEkbhdX67Q0rw6/REpaR89TF3dYw5n/ZDNJePTuzN76sQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9eeUYNmNlZC6EEqbQHH2vPiPk3/FawgN2DY+h/qt40btRU2An
	pTOxTAixRTqXi3tQqFERyguc3Yk4anQN0INFJx7hXlCMXYUmtYOAv5rodM93wsO0V38=
X-Gm-Gg: ASbGncszY+B+2CCO1F90qjOc8Wh/nZBgXXu2AHXgycRHsVQOjdhqzXT7JEN9Nm+FW/d
	/qH4o3htL4ZvRTHsHxFyANLONBnH/FjBOmL5QzY5AAqr1ZyROo0GUncP9m6pYUQLqxbAzHlOEWJ
	ZS0N7alcP9MCGRnLC6pabYvlwQiu+SvY0YVoIzJTjq0ku16/KH7cXU41q1DAIHXPQhJY8QOohlQ
	NWn5z3Q5D10YqEtGCgzg+OHjPcubO5IH3SZd9wCr/EpfRxz7JLa5IrOU+iXKpPvDjGoIwSkRVRg
	pAW2IpfxNpp/XIUMBejBgtvCkUnjEbpMP0Y/zxHIYA7vPV7RQcUP7W7tPznsuQpfyo9CyA==
X-Google-Smtp-Source: AGHT+IE3Ue/jFuqGKk2j82UXQrlkpofLQZxfY4sZQlx7+9veKW80qJCzF944xSFEweUYweW+L+RcHQ==
X-Received: by 2002:a05:600c:698e:b0:43b:cc42:c54f with SMTP id 5b1f17b1804b1-454a36ec56amr26467775e9.14.1751451969448;
        Wed, 02 Jul 2025 03:26:09 -0700 (PDT)
Received: from jiri-mlt ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e6f8bsm16191924f8f.17.2025.07.02.03.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 03:26:08 -0700 (PDT)
Date: Wed, 2 Jul 2025 12:25:57 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Ivan Vecera <ivecera@redhat.com>
Cc: netdev@vger.kernel.org, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Prathosh Satish <Prathosh.Satish@microchip.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Shannon Nelson <shannon.nelson@amd.com>, Dave Jiang <dave.jiang@intel.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Michal Schmidt <mschmidt@redhat.com>, 
	Petr Oros <poros@redhat.com>
Subject: Re: [PATCH net-next v12 04/14] dpll: zl3073x: Add support for
 devlink device info
Message-ID: <x23jvoo4eycl5whishhsy2qpb5qajsqcx36amltwkqwu5xuj7s@ghg47je4hbjt>
References: <20250629191049.64398-1-ivecera@redhat.com>
 <20250629191049.64398-5-ivecera@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629191049.64398-5-ivecera@redhat.com>

Sun, Jun 29, 2025 at 09:10:39PM +0200, ivecera@redhat.com wrote:

[...]

>+	snprintf(buf, sizeof(buf), "%lu.%lu.%lu.%lu",
>+		 FIELD_GET(GENMASK(31, 24), cfg_ver),
>+		 FIELD_GET(GENMASK(23, 16), cfg_ver),
>+		 FIELD_GET(GENMASK(15, 8), cfg_ver),
>+		 FIELD_GET(GENMASK(7, 0), cfg_ver));
>+
>+	return devlink_info_version_running_put(req, "cfg.custom_ver", buf);

Nit:

It's redundant to put "ver" string into version name. Also, isn't it
rather "custom_config" or "custom_cfg"?


