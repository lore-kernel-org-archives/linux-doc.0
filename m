Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="ITWudZqc"
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF92610C4
	for <linux-doc@vger.kernel.org>; Wed, 29 Nov 2023 06:47:56 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40b474c925bso22694885e9.3
        for <linux-doc@vger.kernel.org>; Wed, 29 Nov 2023 06:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1701269275; x=1701874075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GslxNtb6PPSbqhj+SL4+0cnAIH0pvzJXG8XzOy3oC9A=;
        b=ITWudZqc9MQLekM/o0ttdK597B1hpabWKBJ0hR5eC8/JvWBAelbZcr+IQDlGOfRucq
         1LWiCLba0xxI/8e4tdcOAyk1dmhPzEhB/Pc8hJ75kkxB3G85eJIBh4fhJ0eDHx6DWJU0
         eURSj6iVUrZ7jTe4c0FGeZFgp6IoXbTHB1zgxs1eoWbJ73E5PxTUbYJjOn8RcpGEKbcO
         Hff+0WNIcovup01KqilgD7FSVabY1pKWHUUkRSsH0dlafzCOiJ/iByleWTJfdB7pLnSw
         9Ee2qMDSsNuhVBLiVAaXdjXZdV+4w+rKNQHFplp/tdpYrq7FHJADD5FXoov706M1yT6D
         Dfdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701269275; x=1701874075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GslxNtb6PPSbqhj+SL4+0cnAIH0pvzJXG8XzOy3oC9A=;
        b=WKRyv8W3ik3BGx0OnyiHsQybgRAtUl+ljOI9tzsQy8NMl7Aq34Hu07xfgX6zLbduhS
         MfOxRCEK3VK9vaNAfrh/uQ9Qh4Tgkgdh//Iec6mjCCiE6HEE02hDsTGP/PKEbwYtGkzA
         P6/GYKC2c8rlHZ1xhOmY8BthljG/AlAAuqiOq/jcJvmCSQyPqMLyMZWRIxZa2jPFi66Z
         9pR5BBGZdY2J7WcQD/WxgZ3yjiOVexuqoabJ1Vq0Ph9wurtqhp9cwf1jVL5WwOhf5+Ua
         Yyn+sG5WdzN4VpiZEWMpEc8IBsT/KBHyloWVn7nq5robohzltRIGQxPEB2+qlS9vz1IV
         hwcg==
X-Gm-Message-State: AOJu0YxtAt788jZavjkcEO6vqifIulQHk1dh9a0cTisTYA+SRxVe132T
	erte5sFdEcCzPVRnmb1+q/gv0A==
X-Google-Smtp-Source: AGHT+IEnBYi2RWaQQmw26oeqgeVMqTreeHbMhIVCzg6y3e6heZYgvhbZy/KQHEnbN7ppaTzyXM/6kw==
X-Received: by 2002:a05:600c:3b22:b0:40b:3566:e54e with SMTP id m34-20020a05600c3b2200b0040b3566e54emr12253902wms.39.1701269275167;
        Wed, 29 Nov 2023 06:47:55 -0800 (PST)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id l18-20020a05600c4f1200b0040b3829eb50sm2461432wmq.20.2023.11.29.06.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 06:47:54 -0800 (PST)
Date: Wed, 29 Nov 2023 15:47:52 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, Breno Leitao <leitao@debian.org>,
	Donald Hunter <donald.hunter@gmail.com>, corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next v2] docs: netlink: link to family documentations
 from spec info
Message-ID: <ZWdPGD1AEDZgwPfK@nanopsycho>
References: <20231129041427.2763074-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129041427.2763074-1-kuba@kernel.org>

Wed, Nov 29, 2023 at 05:14:27AM CET, kuba@kernel.org wrote:
>To increase the chances of people finding the rendered docs
>add a link to specs.rst and index.rst.
>
>Add a label in the generated index.rst and while at it adjust
>the title a little bit.
>
>Reviewed-by: Breno Leitao <leitao@debian.org>
>Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
>Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
