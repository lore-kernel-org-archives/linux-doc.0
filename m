Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4384D200CB
	for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 13:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705499364; cv=none; b=Wwcjwi058yAiKVIPxuEQ10SbvKJGhZ54/LowvGXg7iFYG79L4zVfeUAZbsvpdaGTdejaFwxjkJ4Hg6dTRGbziWc1K32SQcpMQn39r61TSkplNXsIN1cHpmS0GFYcMdIZbIDkkc21BHPbeMjtj8eztkSi0O4F1ejBS/F+wYPDgBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705499364; c=relaxed/simple;
	bh=9tfLMF8D9oKQokbMf8xX4/RpiMIC9oK/PN7AWqeaVyY=;
	h=DKIM-Signature:Received:X-MC-Unique:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Received:
	 X-Google-Smtp-Source:X-Received:Received:Message-ID:Subject:From:
	 To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version; b=e16Y9myG4kEz2EBZZCetzX+RtvOd+X7mAH+nf7MWOn9Cx4QGgfuVgpRHTdVE2MUthIMSbotrha4kS6eK/JTZDm2OJdUtNyLWZPByq6urpmhfsi9YSU6dp/AByQpqJdFyOoadHe2y0wDOjfQZMUJKrW1NCsI3I6fMgnHKqBYCI/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EWVwH7gv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EWVwH7gv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705499362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9tfLMF8D9oKQokbMf8xX4/RpiMIC9oK/PN7AWqeaVyY=;
	b=EWVwH7gvHDAlA8PbWoHoSYARXdTS3Dt5Fr00YRU8F0gpKK2oWH5bCvKgBvJj6OHByy7Dtg
	Q9jSVe4GApYcUBOT+aqH298cbBXEcAWd3dBryOpYa2ew/mHVRz0ErI6ei8cpTGMEQtjDaX
	t19pWarC4nEU8PJicd3IeqzYGux0nik=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-IgznnOpoOnq9VPhh4zkmeQ-1; Wed, 17 Jan 2024 08:49:21 -0500
X-MC-Unique: IgznnOpoOnq9VPhh4zkmeQ-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-5ff7b6f88e8so202937b3.1
        for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 05:49:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705499360; x=1706104160;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9tfLMF8D9oKQokbMf8xX4/RpiMIC9oK/PN7AWqeaVyY=;
        b=ZUjOmFUs6USdAyfxXcLYNrR9bpn8JSFhBlLRzaSEMKco2riwo62EvsMOtv2QJt93DS
         4DyJnNymenwyFUGDz5fYnBDccsJt9l+1dyTJtSVIgSmV3YIP62ezrY0QFeVd6lqG3N+H
         kRj3ghQ+OdB/AbC57IVZbtutvP2IHwG2Sp4iMmI/1gp3hCHQwAn9ZTQTci9lHQFJrwqa
         sufhYBFgSIJmZ5jdEsdhi8BavZb74Gzu5+SIYF3CgwznBG4Oz19E1d5DtY1+V/Z/7pG2
         c7XFmfcp7Vl8sHPhUM6aLs7S05kj4Z9Jm2qplk9Hqyscfdj8YlVFAdC1IvqPp9nzKSaw
         ZdBQ==
X-Gm-Message-State: AOJu0YzwGuFOkRUSE06NJZ0qOFqqURAO3fX1NCpBFr8Kgeu04MBq3znw
	O+OAD7DUBSLxf7JFnsih1Rd/q7sHXNWQZWiH5uwONT2nze6bY0MeQnPtCV/fHxiqjQumh5vjp0W
	X0Xr8QsqsJI9x28BLKaYzlfx21aw/
X-Received: by 2002:a25:8148:0:b0:dbc:d44e:4ba5 with SMTP id j8-20020a258148000000b00dbcd44e4ba5mr8480322ybm.3.1705499360508;
        Wed, 17 Jan 2024 05:49:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkrBjM+COoqsF6GAkOv/uc9j2UsNiTaqG5gnxQZ8JGCa3W1u6QSyFkx6IypdKek1QXtq7gPA==
X-Received: by 2002:a25:8148:0:b0:dbc:d44e:4ba5 with SMTP id j8-20020a258148000000b00dbcd44e4ba5mr8480312ybm.3.1705499360234;
        Wed, 17 Jan 2024 05:49:20 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.remote.csb (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id f9-20020a0cf7c9000000b00680c49f8650sm5015703qvo.112.2024.01.17.05.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 05:49:19 -0800 (PST)
Message-ID: <33b7c1a458df27bfb36ea4f53ef1cc7abc2a4897.camel@redhat.com>
Subject: Re: [PATCH 09/10] pci: devres: remove legacy pcim_release()
From: Philipp Stanner <pstanner@redhat.com>
To: andy.shevchenko@gmail.com
Cc: Jonathan Corbet <corbet@lwn.net>, Hans de Goede <hdegoede@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas
 <bhelgaas@google.com>, Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com,
 linux-doc@vger.kernel.org,  linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  linux-pci@vger.kernel.org
Date: Wed, 17 Jan 2024 14:49:16 +0100
In-Reply-To: <Zab3yr6J1S-2ujT9@surfacebook.localdomain>
References: <20240115144655.32046-2-pstanner@redhat.com>
	 <20240115144655.32046-11-pstanner@redhat.com>
	 <Zab3yr6J1S-2ujT9@surfacebook.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2024-01-16 at 23:40 +0200, andy.shevchenko@gmail.com wrote:
> Mon, Jan 15, 2024 at 03:46:20PM +0100, Philipp Stanner kirjoitti:
> > Thanks to preceding cleanup steps, pcim_release() is now not needed
> > anymore and can be replaced by pcim_disable_device(), which is the
> > exact
> > counterpart to pcim_enable_device().
> > This permits removing further parts of the old devres API.
> >=20
> > Replace pcim_release() with pcim_disable_device().
> > Remove the now surplus get_dr() function.
>=20
> ...
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0devm_add_action(&pdev->dev, =
pcim_disable_device, pdev);
>=20
> No error check?
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return pci_enable_device(pde=
v);
>=20
> Maybe
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D pci_enable_device=
(...);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return ret;
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return devm_add_action_or=
_reset(...)?
>=20
> I could think of side effects of this, so perhaps the commit message
> and/or
> code needs a comment on why the above proposal can _not_ be used?
>=20

That proposal can be used, so this was simply a bug.

P.

