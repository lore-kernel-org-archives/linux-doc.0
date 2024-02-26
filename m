Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FF97F7F9
	for <linux-doc@vger.kernel.org>; Mon, 26 Feb 2024 12:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708952036; cv=none; b=Re3pbjRUPXYr7q2IkwAn+IPk+gTyuqTocVkTAVhUAIZMFCyebMo6px3WBWrug/TON4unuQTUQkgZNzPALyk15UJP6g9fK2qzsUk966s4QSUxp6EhkFZ9ySzRY93JVrvqedSp+in0JcquqMHf4ZX5RDKDUt/gEza8ekkmTgq1OmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708952036; c=relaxed/simple;
	bh=M9B5Uvew9xAvuUMjh9ofeJ7p8pQRcV7VkL83dSaI60U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yjc2cdCefQ088cXozNgbTQStLY6vDahi6D+QcXNMAgsykUL9V8cUPdUakfE8bVFezxHHN+9MD5haI6Q2qCMM+e64fnY19vNzhh4h5QKreRsZpCzA7ruUrECFRaH/LK/v+o6Ng4r5TXYdY4iP0eaQgjscJEwYmlNWpIx6JYcaRU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=Z9O9xi7d; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="Z9O9xi7d"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-412a4a932f4so7186515e9.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Feb 2024 04:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1708952033; x=1709556833; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M9B5Uvew9xAvuUMjh9ofeJ7p8pQRcV7VkL83dSaI60U=;
        b=Z9O9xi7dxpp7cx8NUpGPeXLqnAP2bM+5vufZEBB1FbO1LLRHK0w7C3uEnE0ZZcUk7D
         124lgXKsnGfHmrA4JsiSP9SPRg6yLCczezFbJmprkr4qxQGgqoodV328KJV9p/fclPlL
         /t1CMNe2Ivu9vZ8Tu6DAz2EvfMxiNvPiex+FxhEdSLVFJLxnMkwEBk2DlQoAD7PIkBRg
         0d/DI1vyiMjIvrtg4lYKZ6NPl2oNtwZf0mjP7vOsdtIC2KZNrVV4S80W6wyYSyyt8edq
         hcgoawZbKD/+Y5FuVunhZxUj5foe0vgWFjwODqpyV6rtD6MrnCp1Edqam0jlnvdiZ2jm
         85hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708952033; x=1709556833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9B5Uvew9xAvuUMjh9ofeJ7p8pQRcV7VkL83dSaI60U=;
        b=q3VxZi5D+WUmgMZDFcvJXO63EfqKvtU60w1GEssS3eqlk3coHNRT1HJDSyJPHpwvoZ
         ysN/K65xWOew26vEbrXDzBAIefJEXnnSlyGUqKM6+yoH/1Ziq1iKxr/DjphvVECVgl1c
         E66d7eidihQapAND5Qp5MHZ9QMETOQ7XDL71vtdwRaQsGkrwWkR5Faj3IJeX1zJlEHq4
         9ET3inBDgVC4O0GeC0TfkarlHGVBn51/f9cTAn4eRMRkCkahHwV3hlwnSeudk4O8riDF
         Pc4VqBDRN0HS5Uit9q/vWFcOxHXPRHwn88ryzWjCsrSgzw9d7YW9DH5Byj8OaNAzV2xo
         akYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWR76tKY8r3ra3Vb4PFv2ke4vBZRxtAJIB6mEdIowoWd/sIHfN+lkXUo+VRKSM1eA7KwhfHDq+PrNwm9Dbdx7pld7P7meZvR5+V
X-Gm-Message-State: AOJu0Yzgr1HjDEwD7uIFukX5JuESo35aQd/eO/zi3q4u5FvZhks6Phzh
	m5nbESqfkDdkCEDL7mwc4Z1/CwD/nbsJXtcahs1sO0ntv6uBNP/9pnO14rMOg98=
X-Google-Smtp-Source: AGHT+IH2HngUcMJC48WFCod9LwDdU8GV8wk6wSxDPAdNYGXBCkBvfwODhTqtj1uuUDkwMZa8j7vurA==
X-Received: by 2002:a5d:5b85:0:b0:33d:87e9:5900 with SMTP id df5-20020a5d5b85000000b0033d87e95900mr4608962wrb.62.1708952033028;
        Mon, 26 Feb 2024 04:53:53 -0800 (PST)
Received: from localhost ([86.61.181.4])
        by smtp.gmail.com with ESMTPSA id g16-20020adffc90000000b0033d3b8820f8sm8172448wrr.109.2024.02.26.04.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 04:53:52 -0800 (PST)
Date: Mon, 26 Feb 2024 13:53:51 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jones Syue =?utf-8?B?6Jab5oe35a6X?= <jonessyue@qnap.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"j.vosburgh@gmail.com" <j.vosburgh@gmail.com>,
	"andy@greyhouse.net" <andy@greyhouse.net>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next v3] bonding: 802.3ad replace MAC_ADDRESS_EQUAL
 with __agg_has_partner
Message-ID: <ZdyJ32Ne-qKs-RDP@nanopsycho>
References: <SI2PR04MB5097BCA8FF2A2F03D9A5A3EEDC5A2@SI2PR04MB5097.apcprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SI2PR04MB5097BCA8FF2A2F03D9A5A3EEDC5A2@SI2PR04MB5097.apcprd04.prod.outlook.com>

Mon, Feb 26, 2024 at 03:24:52AM CET, jonessyue@qnap.com wrote:
>Replace macro MAC_ADDRESS_EQUAL() for null_mac_addr checking with inline
>function__agg_has_partner(). When MAC_ADDRESS_EQUAL() is verifiying
>aggregator's partner mac addr with null_mac_addr, means that seeing if
>aggregator has a valid partner or not. Using __agg_has_partner() makes it
>more clear to understand.
>
>In ad_port_selection_logic(), since aggregator->partner_system and
>port->partner_oper.system has been compared first as a prerequisite, it is
>safe to replace the upcoming MAC_ADDRESS_EQUAL() for null_mac_addr checking
>with __agg_has_partner().
>
>Delete null_mac_addr, which is not required anymore in bond_3ad.c, since
>all references to it are gone.
>
>Signed-off-by: Jones Syue <jonessyue@qnap.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
