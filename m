Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F643612EE
	for <linux-doc@vger.kernel.org>; Fri,  6 Feb 2026 09:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770370955; cv=none; b=HNFNwJCoCnvWuj82UZkJgq5m6Oea2D0LVVjXCEEz00RlaWPclMD5d6jEfR4vnVUbz+d6OwSURxWUwojklK1C3wgHaBbTz1P52g6IZ7Hc440xSLTqQ43re1I/qpyKrheDWlKz+PO2mLeagCEiV6fIruboBajjklMi2IAQMGw1v+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770370955; c=relaxed/simple;
	bh=tko29gTh2LLoTYAs4568Z4zBWZMgYShefsZIF5Fo0Ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gLkeZPjaD8yXVSKoKP2Qn1NKYVTggRj+JFHwkP2B411mwj93BtAXrsBLNvQ0iAZgFMF5uRHRCo4xmqn4vTUPMiRt7nhxlgtoQny52vmlRmPSopnITAtwigvtW9T0vh/kfOlCXnAL5ex/VKlmPTI/dCZOK7UAsR9H5b/c3pgYTvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=IQXaoLDK; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="IQXaoLDK"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4806d23e9f1so21639675e9.2
        for <linux-doc@vger.kernel.org>; Fri, 06 Feb 2026 01:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770370954; x=1770975754; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iyNDbUvGFsSfZP0FW1tm6li3l4kdarvpP/zPKhRvGdY=;
        b=IQXaoLDKFjHthosSnThWePVKl1dPx9eQLoXjQogTiefOpN+1Nhcv1cwIwOxXD0efOM
         Sc1zlYJ5KjoD7FBAX4zj2PyeOh9k6RdMk3JVofUjip5+nuQgy6r4arWdk0w/QaNvCEad
         fi3n+mb3ZpQxO5PRMxYpRINEOcE+nWyTISbq3AQ77DxvQyOS+MZm8xZx04OsAKg5nEcr
         IV3lbl50pc8Seet8k9ECZ+Hee75zbtgolAajF1okRTlEBj6ofbVjmd9kMzvxq8FCzkUz
         tcxX5UlU03BIvl0TSN5QKsj8YXh4gwTn/F0h33eIcSkJlWxKt7OPEgVpYm0N7J51+xz9
         UOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770370954; x=1770975754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iyNDbUvGFsSfZP0FW1tm6li3l4kdarvpP/zPKhRvGdY=;
        b=WSZmvkA+Uw2ttt+bzDbezKimF/IQHk+gQ3oK56PlUoAO1RJNYHbuZxat8X7YpU5DZx
         bdpVAAfQk4adpK6mmNBIBI63cgVpTpXNYi2n352P/ovs2004VpHCxdWQ3p1K5o6FJsaf
         2OZrou7OMhLpNC+a8vAYLM1a/lP5xf5Umdv6ZNU+ke4nKPsIR/nelyqv/9KuNU0CxNZw
         q6H3Pp5Eq5f2ZU/CRRPfwGL2gz1Nh4hKVs5HkH39/4mHzjN3YkUSE2XE+D1zFbFWfdii
         twQJeFxoLFrcg1iUFa84eGGdgBFYgmwKppO/WzHKVpnY3mvNVDKo2PFnt/k3bAri5kEM
         JuPg==
X-Forwarded-Encrypted: i=1; AJvYcCUJ/910EJwSFPoh8c90fHk0hl87v1mvHQY2muqss5dSykclOh8LGtAjae5O4IGI1IVKIs34CKhLvps=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQet0UdvR41O0Xtv8H2WSSLfA2MCe/ZE+2+I9tY+1FiO8NGA37
	08SVW6PE5+8phKdsNph9Vgqf57MeQxCtR2BJaSeLpJxoCCKQxR/Wf4dNSbu+GF2Zl2M=
X-Gm-Gg: AZuq6aLTZtdas/ZsLf6rb4l5jX1oRDYGVWnaNvLuD1cicQYGq9/vGA6zxv6CK3qTDEM
	hTzpOBFv40ph9slXk6uuairIyCv5AzvB9ulRWOQJs40Bi3+5S3fC67WQrvCBAt3H7eJIOJ6J/lJ
	hB4j0YIWMiTKmotgJ3TRb5OwwBvvd9m/Yx4TyN6Rd0bnp6UdHKRRUo4fTlhN4F/fctCTTL6kSLO
	kEkB2hnuZD8zGh+5VWzIm46kkcu+Ogt0DbpQ0ayGrL+E9/u2qaCdL65Wj+TyF3urVJbo8TeMR/u
	4YoxXvCUbTkohqi33HhZ0+chWtRKU145OfoLCvKGfswRf4xAViQv2Hf4AbzMoqm2s7Tt9xEoZom
	SRQB3ssiExV6iaHQBbgritgvChN7F2YKJMTG+w+qrH1uzRI5ZQjMRH4xqCZiculC1IKUQDqC53t
	Js78oYwyT9y15EgZJx1aoZuJsEBT6g3A==
X-Received: by 2002:a05:600c:3f08:b0:477:a246:8398 with SMTP id 5b1f17b1804b1-483201dcfc4mr31888195e9.2.1770370953809;
        Fri, 06 Feb 2026 01:42:33 -0800 (PST)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483228ed4f8sm24728865e9.0.2026.02.06.01.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 01:42:33 -0800 (PST)
Date: Fri, 6 Feb 2026 10:42:31 +0100
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
Subject: Re: [PATCH net-next V2 7/7] devlink: Document port-level resources
Message-ID: <djpsyhzawzquyjhq2dgepf5twxi7fwjjqm5rjwcbwkn7ub43k2@unfqnj2fx4ah>
References: <20260205142833.1727929-1-tariqt@nvidia.com>
 <20260205142833.1727929-8-tariqt@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205142833.1727929-8-tariqt@nvidia.com>

Thu, Feb 05, 2026 at 03:28:33PM +0100, tariqt@nvidia.com wrote:
>From: Or Har-Toov <ohartoov@nvidia.com>
>
>Add documentation for the port-level resource feature to
>devlink-resource.rst. Port-level resources allow viewing resources
>associated with specific devlink ports.
>
>Currently, port-level resources only support the show command for
>viewing resource information.
>
>Signed-off-by: Or Har-Toov <ohartoov@nvidia.com>
>Reviewed-by: Shay Drori <shayd@nvidia.com>
>Reviewed-by: Moshe Shemesh <moshe@nvidia.com>
>Signed-off-by: Tariq Toukan <tariqt@nvidia.com>
>---
> .../networking/devlink/devlink-resource.rst   | 36 +++++++++++++++++++
> 1 file changed, 36 insertions(+)
>
>diff --git a/Documentation/networking/devlink/devlink-resource.rst b/Documentation/networking/devlink/devlink-resource.rst
>index 3d5ae51e65a2..c2bb7e429a26 100644
>--- a/Documentation/networking/devlink/devlink-resource.rst
>+++ b/Documentation/networking/devlink/devlink-resource.rst
>@@ -74,3 +74,39 @@ attribute, which represents the pending change in size. For example:
> 
> Note that changes in resource size may require a device reload to properly
> take effect.
>+
>+Port-level Resources
>+====================
>+
>+In addition to device-level resources, ``devlink`` also supports port-level
>+resources. These resources are associated with a specific devlink port rather
>+than the device as a whole.
>+
>+Currently, port-level resources only support the ``show`` command for viewing
>+resource information.

As this documentation should be kernel one, saying "show command" sound
odd as from perspective of the kernel, there's nothing like that.


>+
>+Port-level resources can be viewed for a specific port:
>+
>+.. code:: shell
>+
>+    $ devlink port resource show pci/0000:03:00.0/196608
>+      pci/0000:03:00.0/196608:
>+        name max_SFs size 20 unit entry
>+
>+Or for ports of a specific device:
>+
>+.. code:: shell
>+
>+    $ devlink port resource show pci/0000:03:00.0
>+      pci/0000:03:00.0/196608:
>+        name max_SFs size 20 unit entry
>+
>+Or for all ports across all devices:
>+
>+.. code:: shell
>+
>+    $ devlink port resource show
>+      pci/0000:03:00.0/196608:
>+        name max_SFs size 20 unit entry
>+      pci/0000:03:00.1/262144:
>+        name max_SFs size 20 unit entry
>-- 
>2.44.0
>
