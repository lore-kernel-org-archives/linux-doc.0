Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486428;
	b=ciEI0LRJVYqWmeUsoxneGEMBKiwbe5R03q4KYEtzq0wFDqrKCZoJ7yY7nP2RjnG9erx3
	 SmbjRWCQnSKMhnOvlVv18nRQa9zNljE0W4ELBy75ECEZhGu9Nx9uBJNftfuWHT8EeUF7E
	 nsSFx++dEEU2Qt/HV4MbaISBj5oTODADL+FCHHP6l+PPI7/4wEguKV967f1+KCy6rpRkb
	 dhx67j0HefZrXDbwIx9boOxXWPTBQ063YvMrBXBfohU0QPetqsotWwpLpib2Mnzl/KEUy
	 a+dQ6a81BEhQUKM2mVd2359TMWzPowwaJire9r98IPuV98bXkZVV+6U+bX6GGUmXlbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486428;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=iG76FGe81ThjV+MovbjEJeBgKtdQS9FtFDDtexgCiYw=;
	b=TKbr6n4o+37GS21zdE+2nguJ42ppH7JoPiCcy9diPkkZxLsgBopo1ZvwkUvdYNkpzz8n
	 t1wR5O5XbdbH/thn4MdxiNcDyfOOduu6EDhKhWmNiJOQv2coj8YHKBiTik9vBdhmCAZ7j
	 fR+qKvGCeQQXjQkwKEi7DBvzq/lrNA3JQ+SWID4R6xcmF88j+WemaOwnHVYQ7PELkHRN1
	 I/ggo+rUMVTrxsrv3K+oXJdxaKqs1B85/BMPN0aKdrhDLo8FcjEFXCxtcnfshiU19ERTB
	 vRGYRuek2D3CDltDzEE5pk8rXZ8i/xZR8ox/ChPA4c2aXGKgWVRMIfX8/4DsAK4Mdgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HCwEqIcE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C52606A689;
	Tue, 24 Nov 2026 02:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HCwEqIcE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 584611F000CA;
	Tue, 24 Nov 2026 02:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795486427;
	bh=iG76FGe81ThjV+MovbjEJeBgKtdQS9FtFDDtexgCiYw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=HCwEqIcEAMMMWCCWWlS/tldOhuh/rRcy0oYH+/1XbYzOavxDQRI2vHIFjQLtgzEK/
	 /RIsR2B22d8dCLoID/WL0Fa7h4VF6ZeXxq79fsgYDrapfHkMm9Ik9z0JTuk9eAtwvY
	 o8UuI9im5oODW60Zvq8qq9dXvQRwDdJCxoi7xMU0N3djdhgaeWQtBa1u275YVq1DaQ
	 BHgxs0gGDGKwVvBADgwePNJ+JmLZ6hOTNlVvf2B9Wq8cINIpervegrQogTi7erE3zT
	 DPa4QutDvEWvjJHCnrbnLD/RmHA3M0sIPtQlBqMdpcAacvMOrZePlMsXOhpxwmhicR
	 kc/l3SeFnNApQ==
Date: Mon, 23 Nov 2026 18:13:46 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: saeed bishara <saeed.bishara.os@gmail.com>
Cc: evostrov@amazon.com, netdev@vger.kernel.org, David Arinzon
 <darinzon@amazon.com>, Shay Agroskin <shayagr@amazon.com>, Arthur
 Kiyanovski <akiyano@amazon.com>, Gal Pressman <gal@nvidia.com>, Michal
 Kubiak <michal.kubiak@intel.com>, Paolo Abeni <pabeni@redhat.com>, Eric
 Dumazet <edumazet@google.com>, Kuniyuki Iwashima <kuniyu@amazon.com>, Shai
 Brandes <shaibran@amazon.com>, linux-doc@vger.kernel.org
Subject: Re: [RFC] net: ena: use tx-push-buf-len while tx-push is off
Message-ID: <20261123181346.383390ae@kernel.org>
In-Reply-To: <CAHfVqdVw9OQ4OPmpLp4pJQhFw_9E7SLwNDjYXYuuGkU95=gGdg@mail.gmail.com>
References: <20261118041238.14396-1-evostrov@amazon.com>
	<CAHfVqdVw9OQ4OPmpLp4pJQhFw_9E7SLwNDjYXYuuGkU95=gGdg@mail.gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 22 Nov 2026 10:32:31 +0200 saeed bishara wrote:
> > - We still need to tell the device how many header bytes to pull.  
> Just to be clear, the device eventually will read (pull) the entire packet
> I think  tx-push-buf-len should have been called tx-inline-header-len,
> as this is about how many bytes of the packet's header get written by
> the driver into the Tx ring descriptor.
> IMHO, we better introduce a new parameter, that is agnostic to
> push/pull mode, we can choose to deprecate the current one in the long
> term.

Agreed on new param, not sure about "agnostic to config mode".
Or if we can deprecate the old one since its uAPI.

The driver can store both values in one tho, effectively forcing 
them to be in sync.

All the new one tx-hdr-depth ? max-hdr-len would be more logical
but we use "max" to indicate the max value for a param.

You can add this to uAPI of ethtool or a driver-specific devlink param.

> > - We want to use tx-push-buf-len for this, with tx-push off.
> >
> > ENA is the only in-tree driver that uses tx-push-buf-len, so this does
> > not change any other driver.
> >
> > Example on a device that supports pull mode:
> >
> > ethtool -G <dev> tx-push off tx-push-buf-len 224
> > ethtool -g <dev> -> TX Push: off, TX push buff len: 224
> >
> > The core already allows this. net/ethtool/rings.c checks only the
> > capability bit and that the length is not above the max. It does not tie
> > tx-push-buf-len to tx-push.
> >
> > In a 2023 review Gal Pressman suggested using tx-push-buf-len only when
> > tx-push is on. That was never added as code or written as a rule.
> > Link: https://lore.kernel.org/netdev/30cb3990-80ce-ca07-6d73-cdc00d0ad7b8@nvidia.com/
> >
> > Request: Please confirm this is fine or if not can you please suggest another
> > way of achieving the pull mode len setup functionality.
> >
> > Thank you
> >  

