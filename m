Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793040195;
	b=TGQeQiSpPhGPxdnyEnYpuw98EYINiSmroPaqge97RdVfB/pL9j6eACUjoyhjk2ibmK5u
	 EX5cd1vHKbeX2k9/NhSQynKIxX792r6TMFNjZP2DjRMp5g6nNE9zieOHyAnCjUo7oohic
	 SujOVbcnvpoEwVcTKu6VuqFq5J4y7Ba+yLq3m9SIZm/Z2k5oxVFmCacCEMhkB5WkYfWPL
	 5yftcrRkmr8wfhUOIkLc1wWZBnrbBKV+zB2L47DIXuPeO6aOaht0B7FXBMytzdpWwTkMu
	 h61nzJitq3CVpKyEt8eZWd+w/uk8RhHvsnCY1BN7Rbyer6WJQYT921Zpvw9k7darBcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793040195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZWci1OY37Q98PjNDa+DsqfD5q79/im0Ez6T5Vupv1s4=;
	b=uKTnRXbFJIi8PPY/kyR+lvW4i2MwJ8Usab55AnjdLU3AQKkXClxhRnzdH/j1oSXbed/P
	 YtAK/yZI1u5ABrBWahFSJjUfcSr3C/KbdOi8zlxLmDB9fcF4JWxd9X+Ug/H3Vo9HF/GtN
	 neM4urFGevFM5pq/+KXG0kBxw3RVinwYymDToYfnbGSBntSv+seyr3mNWZmTAdQXzfnSq
	 KbwmvyVT6h/54tGs7z9O71+F319P1nsyAYU/ppv1nXsbZ5n0N7+ZuZDQyWtOYGqnD+G0R
	 pFapaTFBFHHeaQh73Rcbl1RzRjlY7AMCvA2S0ZKXs0QfirnAE0cjUDA843YouprekNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=azZPsctq;
	arc=none smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4099B606A321
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 18:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4099B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=azZPsctq
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-943e8d35f74so94699185a.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 11:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793040194; x=1793644994; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZWci1OY37Q98PjNDa+DsqfD5q79/im0Ez6T5Vupv1s4=;
        b=azZPsctqXRKqpOwzOSUanbXvvxd+v2oxaACaz4naHK4U/NBQWTZSH1+8VRwPrLVwY0
         DocnyrGmPyv8LQRxTMk4K4sAlQVJBR98rqP+2aWoEAiU0n2xJtP2lXe11PdsBX9zw7zH
         rykKuo4jE8Sw3g1ZHf1cUaz2vGbXwYAs98RHcsf375OaxpJvYYqyPF71AEMIeOtk1CIf
         vDE/ajmi0uLVqaMusVBTVkVR8NUGi0AybkTdqBwAenvqpPLeBFRcUdif9SgXW44+UVBP
         XcslWkg4kCuQnmXySZ0RwdZ8wSe243a/pyuPpY5dxc6Pr/hlCqlSwaLgYcUdwFY6ZPLq
         p4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793040194; x=1793644994;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZWci1OY37Q98PjNDa+DsqfD5q79/im0Ez6T5Vupv1s4=;
        b=y0Qwl+AGLYzgwWWxl7Rv++As7hX6x9rs6h4DKAnb0v+WtP4auwzN+0FV2fqc67SzVy
         qH+0MD/pMNhkfl8ij3LChAQi5HLjX9Ian/x9Xvjs/5zLtVAck9crKTaiwnJU2cNuq8Ku
         mxzyXqimETLcY3vJ//oqzSUe+TjfxcMHBNnfFcXK4JRrF9nU81SgpDISKWSO/2ct9/35
         BD8IO9Wm1YaNXiE7WfT4vT+OnQOP2yd43HepRjmLv5zPjRf3+QCIqVXrNuf3rslKz2F1
         A3anK7a4+j91VMWwUxSjz1DUGPkdM7405huwF9VxyX0JvL2zpB66wau0aYXg1Kj+fdoO
         8xTg==
X-Forwarded-Encrypted: i=1; AKwUvBxYxq0G2UeNEX5xLlyKeTsgJFRrhK/PYCSemz4hpyr8ldvFrYjavVH36vkShJpcUazq8BxQfLUKpCQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIODi6Cf4AzvjDMdCaKAGRpvNkp5IHZ7CcdFQYfvhbP2GuvA025
	lIZZHXvLP7xmeOqLviXTMPZEZZ/RlEEI/Ku0bcsYtrLNZRicqzZKgD6ZneK2ww6LDIU=
X-Gm-Gg: AYBFou2xP9LG0n0hra1EpyjJjTKMMOcslCKi9OVsLknYIx7Oxrgj2TY2xJEE90uJ9RW
	/+o2FPJt6hUz4vFnx6FXerIjS6ySx4/TrtrMAFnPg91lAUTqCWstTPr2F562drmGJONTHqa1122
	1L4zRekerHixby/SbBc24GiwqQCGlnj2VbYMGkJ8AS70zW/tmfMr+VUWi/nrEqZkM6+yErGEdNu
	BiK28X/Qc4egk9ShfSL1PNr6NAPQKIliDt4THDHSoRchxUMh3UCModVClw1/HNIoLG/T5caxLJN
	7ViliA/XnfCxvTt8+GiTWCAr038rwgjIhWx61TnAyA24A91pzNQsWStLR+imqgPoRLBbtzr+8Z+
	U8ol3mJLL8tjOmpM6mhfJKklijVTtiQFW0lJcd9X325JvctJNHvOOgbEo3arWV8C447eN7mMprc
	D7rADC3KmTP6nLXwQiHqThrULL5joj1wvMUJK4VAK5gsUY/rlEpLO02BWOqxmEkD47Zt8HJChT9
	HLLRuHomJHRcoLpxOdQcQ1fjj62NRFkMQBR6qySmDskNcFVz1HIe7Xynf8XDEcu0vqEqnNC8AxX
	wEpddzR6eQE2h8cB+t0LZD99lKXbzboQ/t5VvfIl8+80fXK2iRpWCO6PLijxH61lCZM6JvQcoQG
	RKH17kzQm+XM=
X-Received: by 2002:a05:620a:172a:b0:939:6c31:2318 with SMTP id af79cd13be357-940ef8d8389mr1233127985a.34.1793040193950;
        Mon, 26 Oct 2026 11:43:13 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f067c879sm758709385a.16.2026.10.26.11.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:43:13 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xLPf6-00000007foP-2hO4;
	Mon, 26 Oct 2026 15:43:12 -0300
Date: Mon, 26 Oct 2026 15:43:12 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Alex Williamson <alex@shazbot.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Armin Wolf <W_Armin@gmx.de>, David Lechner <dlechner@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Bradley Morgan <brads@mainlining.org>,
	Aleksandr Nogikh <nogikh@google.com>, linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-usb@vger.kernel.org, driver-core@lists.linux.dev,
	linux-trace-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Thierry Reding <thierry.reding@kernel.org>,
	Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org
Subject: Re: [PATCH v4 0/3] driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers
Message-ID: <20261026184312.GA1685504@ziepe.ca>
References: <20260914-bind_taint-v4-0-eadf8a090903@linuxfoundation.org>
 <DLIL9H50MALI.3JROXYEEUM3KU@kernel.org>
 <arIvG0nx4LXG9nlW@monoceros>
 <defb3953-7516-437e-b70b-d57de55b91bf@baylibre.com>
 <9bd3a34b-5e98-4038-80d6-da2c3b1948dd@gmx.de>
 <2026092321-province-yearly-44aa@gregkh>
 <arOfHEsGGglNse7T@monoceros>
 <2026092348-victory-erased-0e5a@gregkh>
 <20261023181326.0dc2f7ed@shazbot.org>
 <20261026122243.GA28851@unreal>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026122243.GA28851@unreal>

On Mon, Oct 26, 2026 at 02:22:43PM +0200, Leon Romanovsky wrote:

> This is needed for two reasons: to save hardware and software resources
> when creating a large number of VFs, and to allow the PCI config space to
> be configured *before* the driver starts using it.
> 
> There is no in-kernel alternative.

Having userspace involved in driver binding has also always been the
plan for confidential computing needs. We cannot have a device driver
bound across some of the HW transitions like TDISP shared/private, so
there has always been an expectation of bind/unbind.

For this case the existing sysf drivers_probe is good enough for bind,
but we must have taint-free unbind for PCI devices too.

I think this patch should be reverted ASAP, it is a pretty major
regression for a lot of users.

Jason
