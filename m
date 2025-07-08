Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388492222D7
	for <linux-doc@vger.kernel.org>; Tue,  8 Jul 2025 19:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752004217; cv=none; b=Gu0iB/eVMhJgYQjE/JWaypIYLmEoK10HhnlKPj/zp2zuXk736leXRgNE+jmMqUH1FRO1+4R0WNgoLgJ3S09It0gj7/IZY+qU59Ds4YQ2oz1CWNkNwHJANlpXUFUBeKqkEw2BSM4xNw3vwePB0e4IBot2+Rsf1eQePjok/b9o5Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752004217; c=relaxed/simple;
	bh=Y0iXoUqOLs0llj8Kqny8AlCcLxbD6abRir5vykfWqaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T0pZP4OMdQOo6XJ4h7GWdZpeMjFLBTm5r7LLexAGQ3DAEzLJnU1eQOtNSYjHk3mCFlo9V0aVghgxp0uE7Q1kLwY9pekE72IGfiloomVTA/3r72HyZSpgwog1hgGubg2PD7u1b05xBGEeiaWytfqMWLW9l4/KCICxY9RclBoEUGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GZyFD5Q8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GZyFD5Q8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752004214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LikuVg883RBnSofMj2iv/RfyoEWwYa7j+D9dFy02hRA=;
	b=GZyFD5Q8Y2QrIO+wZDWTXY5JOTZQDLcFWytZccqPRXOJ2dzyP5AhtSMrlJFc5XQLceS2V8
	iKHXwKKoELdJtKRH86G2Zhf6cOZ1/7ELtOnW13H8YvrZga4rZm0ibVDlZhKCs5TVaTemXc
	5+rv75mc3VsfdKTW7xu8L3yP/eAhh/k=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-XFhMKQvVNXyTZEczIr23VA-1; Tue, 08 Jul 2025 15:50:10 -0400
X-MC-Unique: XFhMKQvVNXyTZEczIr23VA-1
X-Mimecast-MFC-AGG-ID: XFhMKQvVNXyTZEczIr23VA_1752004209
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3af3c860ed7so2198774f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 08 Jul 2025 12:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752004209; x=1752609009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LikuVg883RBnSofMj2iv/RfyoEWwYa7j+D9dFy02hRA=;
        b=A2WzlD/Hnk6SQQDw8n+qVbPMx/tesfTt2LFaTaM6C+P29PBuHK1jjom7MJgaTu9zMB
         gddSuFGHH1Svw4MRzerNHuRqyQjk9sqGDkUnlaUZdHP0wPeWXTETgyGAH330xs4KKoGI
         OZQtp8pwhaFTZ2zGOIFXcf6eEVfYPjzsB6zX9PULvfgvHM8wsU/KPCoAm37pfF2PwL5V
         GwTAL+fS7SpWUME/5dxZ1lNG8klFsknsAXcz5WxOB3giSVE3O3UCFM5uLPoR1C8CYioT
         BFV/2yzd2hxmE/LupmZZPHWcnyBCcFGekZNYt7HLrOuSkvkkwk4cRhxeNY/Qhfxf+GRC
         A7fA==
X-Forwarded-Encrypted: i=1; AJvYcCVwe48W6wuduSCnqt8/TtJue7cu078xbK0kV/z2/yU1rxXoXbhFvY26ybqBNtkOCGeM/NSXCssM3Uk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy69/TINEL8GyAWxuJSu0ajhHXF5q+TUHCuQLQ2l4mSSXkvfbdE
	mmtzHyn+NS6pHFzMFokRbWBwEmiXUCly6Iha4rrprKZCbEneQn8B1RmfCsSgTltBLOBgPYaG7U4
	ywSLvfUdb+rgT26izJAN25ePhmvhbvNNOadQlTyc2VrwhrchG0sAyBUf5aspx3g==
X-Gm-Gg: ASbGncuWo5FvQuMqFT9sRbB0VeZFTXjdMNF9JeXMvzoqIg50wJq3WrVp821ggbxI5U4
	8pXYmEOWUDKeqiNuEQZE6QPzmbraSbeout62hzKTFt3bm/lNw+6bZSb8/7LcpUyaUarQMxlggu7
	UEa+rZcpA8gEmytgxEzzpPjdw0NtLggNRNYwr4BGI4eYcvszl3uzP67rlZO7ZRuyP3TY3kxeuoE
	E6sxTCqVHDFMyW2dO+b5N5nXxSK8YURs4hgmiOwtz6ZX41BWBvPZFKCoeOrYDEq/PlP2E3wzzZl
	DLKmRsfSvIq/wws=
X-Received: by 2002:a5d:5d0e:0:b0:3a4:f35b:d016 with SMTP id ffacd0b85a97d-3b497011a15mr15320222f8f.11.1752004209397;
        Tue, 08 Jul 2025 12:50:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1jBraagOsk3QI107z1D1hHowlYV/qp00H/NJFxbB801oXkh53Lpf4M+P4ApVMlSTE/u2Aig==
X-Received: by 2002:a5d:5d0e:0:b0:3a4:f35b:d016 with SMTP id ffacd0b85a97d-3b497011a15mr15320197f8f.11.1752004208849;
        Tue, 08 Jul 2025 12:50:08 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:150d:fc00:de3:4725:47c6:6809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454cd49e64dsm30477795e9.34.2025.07.08.12.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 12:50:07 -0700 (PDT)
Date: Tue, 8 Jul 2025 15:50:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 net-next 0/9] virtio: introduce GSO over UDP tunnel
Message-ID: <20250708154718-mutt-send-email-mst@kernel.org>
References: <cover.1751874094.git.pabeni@redhat.com>
 <20250708105816-mutt-send-email-mst@kernel.org>
 <20250708082404.21d1fe61@kernel.org>
 <20250708120014-mutt-send-email-mst@kernel.org>
 <27d6b80a-3153-4523-9ccf-0471a85cb245@redhat.com>
 <ef9864e5-3198-4e85-81eb-a491dfbda0d2@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef9864e5-3198-4e85-81eb-a491dfbda0d2@redhat.com>

On Tue, Jul 08, 2025 at 07:00:19PM +0200, Paolo Abeni wrote:
> On 7/8/25 6:43 PM, Paolo Abeni wrote:
> > On 7/8/25 6:00 PM, Michael S. Tsirkin wrote:
> >> On Tue, Jul 08, 2025 at 08:24:04AM -0700, Jakub Kicinski wrote:
> >>> On Tue, 8 Jul 2025 11:01:30 -0400 Michael S. Tsirkin wrote:
> >>>>> git@github.com:pabeni/linux-devel.git virtio_udp_tunnel_07_07_2025
> >>>>>
> >>>>> The first 5 patches in this series, that is, the virtio features
> >>>>> extension bits are also available at [2]:
> >>>>>
> >>>>> git@github.com:pabeni/linux-devel.git virtio_features_extension_07_07_2025
> >>>>>
> >>>>> Ideally the virtio features extension bit should go via the virtio tree
> >>>>> and the virtio_net/tun patches via the net-next tree. The latter have
> >>>>> a dependency in the first and will cause conflicts if merged via the
> >>>>> virtio tree, both when applied and at merge window time - inside Linus
> >>>>> tree.
> >>>>>
> >>>>> To avoid such conflicts and duplicate commits I think the net-next
> >>>>> could pull from [1], while the virtio tree could pull from [2].  
> >>>>
> >>>> Or I could just merge all of this in my tree, if that's ok
> >>>> with others?
> >>>
> >>> No strong preference here. My first choice would be a branch based
> >>> on v6.16-rc5 so we can all pull in and resolve the conflicts that
> >>> already exist. But I haven't looked how bad the conflicts would 
> >>> be for virtio if we did that. On net-next side they look manageable.
> >>
> >> OK, let's do it the way Paolo wants then.
> > 
> > I actually messed a bit with my proposal, as I forgot I need to use a
> > common ancestor for the branches I shared.
> > 
> > git@github.com:pabeni/linux-devel.git virtio_features_extension_07_07_2025
> > 
> > is based on current net-next and pulling from such tag will take a lot
> > of unwanted stuff into the vhost tree.
> > 
> > @Michael: AFAICS the current vhost devel tree is based on top of
> > v6.15-rc7, am I correct?
> 
> Which in turn means that you rebase your tree (before sending the PR to
> Linus), am I correct? If so we can't have stable hashes shared between
> net-next and vhost.
> 
> /P

We can, I can merge your tree after rebasing. It's a hassle if I rebase
repeatedly but I've been known to do it.

If this is what you want, pls just base on some recent RC by Linus.

-- 
MST

