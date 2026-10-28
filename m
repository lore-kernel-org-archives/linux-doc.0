Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203789;
	b=Y6gpriW3IHCp9F3QhbNtfmLTiIv3tKX/E7efOiXBTVsBSkytMXv56V+FZbssiQm2Is2G
	 ysxyDDok92I2jkg76BhRzyD6Oxtzypj9TOXRbc85yznjS048cmXHnWkzpqTENLxmVN5eg
	 Adv87QEy6KO3yyagWpe+vHNsEFlgdFDZ1E/qxbeFmnYlkoOVzre8OauGZ9hjDn0IprTxe
	 FQHNsZebjNj1O0Yfi+ZcfK0qA0Vy1Pa0KXw8XgjIlszfSCWQmU6pU9DDorbvcctTBrt16
	 pxCO44e5ArSohecY4GQy4ZuMfLZJybTlrsbMROJcnan+iiReRkjHIsKUnDOmW/fIhTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=YZcts4qcYFLKUzeEZmCB29OAtaKV7wlY2duix3l+9sA=;
	b=TyaN9SVvXK3Qxwm4JprN//OuWpLJIyrA0aW8e07SZIw18oo4E8xr/mrK98vdMVGNPCBE
	 hhn40X8QlrNMira50fpabx/w+PElNlWuWexc0XWYtsUo+kx1By0Fke02qUV2YQZNlCt/D
	 VO8Pv6Y3lz5ItDq7QYFR5dKQ/iiexilV7JtIw1fXw1QpC71IXHjjcbKB3lE3k9DH+rJ1l
	 luukEQBjgSW+7zQe5+jDEpif6uzP2+6mavs/Ns9gCVs38kUmaHIEKRGn8mq6wOM68lqHD
	 1kz0fPoZyA7oocOyumGTDK+7gUVTY0SSav0MKn8TdCxU1zoughBM80kxHN2MwBVY8mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F40606A31E
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 16:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6F40606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so11227035e9.2
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 09:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793203782; x=1793808582; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YZcts4qcYFLKUzeEZmCB29OAtaKV7wlY2duix3l+9sA=;
        b=Ji5Xvtpoxyb8kVn4SdVY2cX+DsEgu1bKkZdsC3ebjs4d1+CltzAuRtjoP6qRorAjmm
         U/OTale8tpuOeROnVeyxXNIIaWfog47eEJFCNp27SbEPsWiXlbJSFUU7KgmL/w+kS1Qk
         Xoz40ZBJl6WRqwF7cZjV6sWb8IbzqZcrFctXWKFMXwrZRtrx0RyDRwjEA32GAPhICZjW
         MQaQxgB9raqsmYBxkaP7PzkQnI5sX89vYUiv0DZuFdVs9fh4gndC7Z/ZAgGohdQcpiRV
         +IlqliYlhUTo7YEUzaeGWGEgvu/pIVHVtE9NKkTWWWXdySGqcXDMlZXy58QAKS+slkSX
         voyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203782; x=1793808582;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YZcts4qcYFLKUzeEZmCB29OAtaKV7wlY2duix3l+9sA=;
        b=AD9BZGePNaAK2P7i4CLq4P7880o0xr4rmlynn2K05hgrsQTa11C9in1zQtJ92dZI7o
         vcjyIsdwKHgb3yKqXYXnG0dZQyhQEfqrs/2sy5d2fkMJ5vVOSrtsfMDfrXm0BMLnBlCz
         TvXml5E9SEuwySqCLNwsZOGezE5Ya1tlynELSCr9uPxkinH0TSoy5fBY0fcNLUwnbKig
         dOeS7oBWWFTt9r5Z54vJpOnOAs+lXdXnCtCcDqzbdNbcdtxTeX4RGM8lUyH+2pKcHhg1
         8u1J/bRsQIrU/dT+1Q+JMOuHp93e3H/bAdggFmroIJI5/W2xE9N2oQOVD2Qpy1OgY+wm
         TEfw==
X-Forwarded-Encrypted: i=1; AKwUvBxoTzOmen8KOkmzcqMEj7ts5txm2xLxN8H6TkBsa5FJCAd/8izhOQvttMpS8SGfoDzn8giE6r3T1tE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQsvTh231BTcENj6Q21mB/b+e6kUmryGPLbOILt0BY+gUUPCIq
	OKPyBjjf0W2RhYYBY5/HBNivFuG81pHoIbxMr/YRHrgNAkFLrWzBHxtyYHoVFXK3WTk=
X-Gm-Gg: AYBFou1ILy+o6FNYhCf8vZvfzfNpDfEiSEToZZGCtLm9onFGRnT5L+LjMrbAk9utUX5
	X7gLgUhA+RSdcBYb9l+i5rbz9YD17y4R3x5ShjiQ+g0LbSB6QuHicfSyYDfy1gVHpKxhP7y07p0
	J+LVc2uzdFsTkz88tdj8MOof0DgTK7k9lafZS0lFkv2d40xiu2hAOLtqSaUHzr7q/lpyDD3LzqL
	TZzcwq0tyKCvWOQmE+k0s9QDdNdx/Fz14wn0j4tWklme2hXSZBoqloXtZarwkGU1PHVC3p3frpX
	NgFx4FmdXho50X7y1ciHWtKcEq+y4jUSOPELPJgk8P+CBnJpeP8/U8rnGJfWSfysrinSpuzpLmN
	hsQ0UlFSSsFinvmzjYKEgfHpwckSN+OdHTzypCsl9LjRBqEsgVqWl7KkaSRM6soHXqZHZztszii
	/WUcV6Go2K0GxRFyodle/RIlrC2wA4VYOjuJAnzCrkDL7Hil6oqUTu2hRPHh8Guhdtv6j9JHK89
	CVxQbp07bTPEeT+501tZ/+qp3K/+OYk6zauDMJJAk4d7Vaho6Od23SZ3dM/qtqLRuef9lsWZRF4
	1ZQxC2NcsyCKQCBOc5fOhpkxcce6nA==
X-Received: by 2002:a05:600c:4f89:b0:4a1:c6fd:4db0 with SMTP id 5b1f17b1804b1-4a966c41836mr68052215e9.19.1793203782221;
        Wed, 28 Oct 2026 09:09:42 -0700 (PDT)
Received: from localhost ([82.192.120.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa8213ead6sm1572025e9.14.2026.10.28.09.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:09:41 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 28 Oct 2026 17:13:35 +0100
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Stanimir Varbanov <svarbanov@suse.de>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-pwm@vger.kernel.org,
	Gary Guo <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH RFC 3/4] hwmon: Add driver for Raspberry Pi RP1 fan
 tachometer
Message-ID: <auIfL4ZGdfNDUZxO@apocalypse>
References: <cover.1792748690.git.andrea.porta@suse.com>
 <0d2249a66732bfce38a2260bee08cd1ba4097e51.1792748690.git.andrea.porta@suse.com>
 <auGdsv0OVG4iLjZV@monoceros>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auGdsv0OVG4iLjZV@monoceros>

On 08:02 Wed 28 Oct     , Uwe Kleine-König wrote:
> On Fri, Oct 23, 2026 at 12:15:56PM +0200, Andrea della Porta wrote:
> > +#include <linux/platform_device.h>
> > +#include <linux/mod_devicetable.h>
> 
> Irrespective of how this patch set evolves: Please don't add new
> includes for <linux/mod_devicetable.h>. <linux/platform_device.h>
> already provides of_device_id without introducing a batch of unneeded
> dependencies.

Ack.

> 
> Best regards
> Uwe


