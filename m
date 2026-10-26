Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793055307;
	b=zfFsF1iLU6Rj1mRxjFGLnlJsPV0+Q2URw4cSB9xEegIE6T2rlAexVy3sDr9DlmrNCaTR
	 FQZmHxnGhzmVZaQ0nDqHuEfx7+rPBtkXctLM9mOwKBImWnl/UkMEcWLNSBXAdMDS5kteY
	 IsZYTOEnSAjSWzR16f3WcgjEqG8DoRPpRM6DjrgSY7umQL5c6a/sX52o+mem4fGfQCAel
	 kH0IfryDE39wGSvl2KxZ0LGvC57OCc9yYgu05JzkfP614Ds3k6E/1t1mdk40iohjM9cw9
	 pgQUa3lnk391d//BrmL44thwTiUks6MS3cJsRVqkJRDC2fcd7b2265qydu6ZhGAxpHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793055307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Qv4yXz9mBS7TK9aKYpPIFfG0d3O9zFyQxnBKda+GG2U=;
	b=gffbdOxGXKFvytAnXjaNsfmWBai4YApl9bPI94cgoECYeZd+X5q0mDviC9/cS2dN3j8/
	 YtVIr6oUglGmiBIJpSY47Bm+jkM2kuh/cgr/vxe3MLQmG755DEVk+i5WWB2C+L4OfQilW
	 yPt5GZJFei3eC8GNEAGvCRxgrpsKlfu+c9P5Sl43KkbQvDSRqWgqbsfhbkBFnR0O7dX96
	 WTu9Gq3fl48CnberSp2lPgF7mPr7w06ppkHWJvLrXzcIhOMSsOaU4Aw3L4cc89ACs5DVo
	 iE0DoadEgB/FSeuR9M2vmsPxELmf26wKLb4AO6zXqqDQcdunrv4KEoWkvub+hv/J+og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=iE1vhkuf;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F767606A321
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 22:55:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F767606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=iE1vhkuf
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5365b48238dso28171681cf.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 15:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793055306; x=1793660106; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qv4yXz9mBS7TK9aKYpPIFfG0d3O9zFyQxnBKda+GG2U=;
        b=iE1vhkufDNk47J0y0sfQfrcXvv7YwF5xZFg9Zgo3GIzWAPWbTFVaeyw2U0dtOlPag2
         5dWMf7SyNSgNhsm9D6diSHIdA69bKNuWJ33g6Ws86B/FXC72+OUoK0GlOXNcOXMMUb7j
         vEQdmCqpATKVE6+OWcRHTpwNRrYJBNMNiiH9SbBKxx83oBE7NDzOB6NP/kzPMrB7tS1u
         BJ8R/xA3Vtfw1W0CvF40clDWUJO6jz0fi1k5djJewrxA40gh6oNqWlI/rreVaHKQhFSf
         2D4NvJf4yKKhk9yrS9MArPN93WnWZW895J1xZMvYhJ7gHZqrZyRRpjbacUJzAeaZicS/
         ct0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793055306; x=1793660106;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qv4yXz9mBS7TK9aKYpPIFfG0d3O9zFyQxnBKda+GG2U=;
        b=1n0nV71wzzItj3hzK/CJZGG/SHX1O2zgMj5SqRCq/KChiybqyoC9HIUGSsc1ofJs1G
         yE50Dy+mnWDgfcL7MkYv89GRVSLXYoB3OiDo6CL2cl+Z5xflAgQPxj21GEnVxIWX55Sk
         IJs17O2d0zmlrAWaRC2+pINzJAFtOTsLWsHnVKDLD6irzX2SpJg06l6HdGYEwig5xetH
         eANcmK1j6uao8PUpmfHo9MqMR+NVXg++wIHusTzzQQmo9VAa1N273qwyjpjlDOXIHYRm
         uEug0lb4UYh65/8iuyvuU63kP6OlITtAtBs+Tk+4OxnqBUiTSqOIuH5RfG/MBeEI5TbQ
         I0/A==
X-Forwarded-Encrypted: i=1; AKwUvBy1q2Krrc04oSBJBuiydUMe8p1lZgpj60N0STyMwxMabrWPxFeqZ7GrT/rc1Xo3UvohajCAI7xQ2do=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCZFANTaWi9KBcOKPc+ga3wu9Pp7mR1pARYH+RCs+H2CBPqWcG
	y06Jr6yT/fBfUwJPXp4YxlGegeZMPSR9qxXaBd//pCe5zDEAetDu5hbWiDsuu2FPSJs=
X-Gm-Gg: AYBFou249brMdcN124PLXSqPLg/0lz3BU1ZBZo9ZjpG4XiiIF2Q+wkc6frRE+Lz2dHw
	oGW1B44BAgSTSe3sK+/9J8h3orc+yWT1iV9OSfKgi49X896JdJMvL4QEndxbEw3YfIl9JrWzaj9
	dUqL5Ml2flEY+EgVUHTK1Q8C6uaWDU/10wPs6fHbAXE5DXFuOGxPANPHBa6r8hdLsG75xzqLrpP
	RtCWHq+WG4pPFfS8VjNOfxILnv5IfFFbFss7OMsmzeYMt5iLYxvRqkrihyrpPjJN3CtJdzC1Kx6
	ezBfeiFCuEJAH8S7tDA2CFaUVOIg4Hsdmql4NtUDXwKBolWd0Czo8w0Bej0fdkG+OFNoc3QDt+i
	WHAWBrbTAKjxbgyjrgyExtC2a6yvI1FeMRNJMsDDRwJfuS+msjpVB56dB7f7gXf8sZS4fwyrVVV
	2Ny32a8nrUf4xn+s4T0whuJORkHBvYNtZlN8TntYScy6r8xKmJ1FhTz/yJdJzgkHC9H/fw7qwWx
	vGC24dLkFu/3mTvqOaD8rnA6BdxYRu1eXeWi/zjPKQaDSV8E/vJfnOPEbH9y2yGnp3Or17MVID/
	RvnHAvB7aDb9kXXvHwz1UYsoB7EblT2xs4gOFA==
X-Received: by 2002:a05:622a:4b18:b0:535:80b:9911 with SMTP id d75a77b69052e-5383b4b0e1dmr122069761cf.24.1793055306222;
        Mon, 26 Oct 2026 15:55:06 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-538394c565esm66284051cf.6.2026.10.26.15.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 15:55:05 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xLTaq-000000088rN-3CrV;
	Mon, 26 Oct 2026 19:55:04 -0300
Date: Mon, 26 Oct 2026 19:55:04 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Leon Romanovsky <leon@kernel.org>, Alex Williamson <alex@shazbot.org>,
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
Message-ID: <20261026225504.GC1685504@ziepe.ca>
References: <DLIL9H50MALI.3JROXYEEUM3KU@kernel.org>
 <arIvG0nx4LXG9nlW@monoceros>
 <defb3953-7516-437e-b70b-d57de55b91bf@baylibre.com>
 <9bd3a34b-5e98-4038-80d6-da2c3b1948dd@gmx.de>
 <2026092321-province-yearly-44aa@gregkh>
 <arOfHEsGGglNse7T@monoceros>
 <2026092348-victory-erased-0e5a@gregkh>
 <20261023181326.0dc2f7ed@shazbot.org>
 <20261026122243.GA28851@unreal>
 <2026102654-enlighten-perkiness-193c@gregkh>
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
In-Reply-To: <2026102654-enlighten-perkiness-193c@gregkh>

On Mon, Oct 26, 2026 at 09:27:25PM +0100, Greg Kroah-Hartman wrote:
> > > Sorry, late to the party, but this isn't a few user scripts that rely
> > > on this behavior.  Effectively every use case of vfio relies on this
> > > behavior.  We rely on unbinding the default driver from the device
> > > before using driver_override and drivers_probe.  That means every
> > > hypervisor with device assignment and every userspace driver use case
> > > now experiences a tainted kernel. That seems like a significant
> > > regression.
> > 
> > Sorry, I was on vacation and missed this change earlier. This change will
> > affect SR-IOV deployments around the world, which *rely* on being able to
> > bind a driver manually *after* virtual functions are created but before
> > they are used.
> 
> Why can't a real driver bind to those virtual functions?  Like is
> happening in the rust apis?

Most people using SRIOV will bind the VFs to the VFIO driver.

The rest, it is the same as the CC case, there needs to be a gap after
creating the PCI VF functions and before binding a real driver, with a
proper match and a correct id.

This is usually managed by clearing drivers_autoprobe

Ie look at commit b8c5cec23d5c ("Driver core: udev triggered
device-<>driver binding") from 2007 explaining this workflow.

The taint on sysfs unbind makes zero sense here because we can trigger
unbind of those VFs just by disabling SRIOV through sysfs. Should we
taint that too?

> > This is needed for two reasons: to save hardware and software resources
> > when creating a large number of VFs, and to allow the PCI config space to
> > be configured *before* the driver starts using it.
> 
> How is hardware and software resources an issue here at all? 

If you create a 1024 VFs, which is what people on big servers seem to
do, then that can use 1024 x megabytes of resources to load all those
drivers which will memory exhaust a hypervisor.

This is a real case actual users run into, I saw the support requests
go by :|

> And you can write to PCI config space from userspace today, 

Not allowed in lockdown, triggered by secure boot, which pretty much
every server uses.

> > There is no in-kernel alternative.
> 
> Then just don't have a in-kernel driver for the device and all is good?

What? How do you use the HW then? Is this a serious reply?

Jason
