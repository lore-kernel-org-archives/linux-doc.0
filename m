Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3502432ABC6
	for <linux-doc@vger.kernel.org>; Mon, 29 Dec 2025 16:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767024085; cv=none; b=u2KSr1PK+1DR3RsUrKvFT8mLl8+PZUgSR+0rOzDnsCcYJVnJUn6sUvDG6+T/Ac/ypmC/aRwsU0gkKdQZqpn/3aoxTdOf5072X0mEiyK9xQLYsih9AtAU7L6cJlXOnyC2Snq9GDw+IffPrZviG+yo1+nbhYUOX7uwVEdHBzFVuFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767024085; c=relaxed/simple;
	bh=js7ViGIRkquCYlUnpK3Q7wy4tDgL8t+TLvo4d1ePCwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Un+KMMnqsoJ3a7gcsm9VejjbFkEUlxSd/rM5jtg5NBgcIne2NEU43MkqmcrhYimmzrEAMH3mExcVUKSJVJj45vGGA6uoz7vemelncshFvQuSXTi5PYfRyXCf8Zh0SQjkRW/6IIorbMmpoRD2HpEAQg9PhMPomEFtLovabvpyK0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DpYChT5e; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DpYChT5e"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42fbc3056afso4940441f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 29 Dec 2025 08:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767024081; x=1767628881; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8LjbcYN47mqFb8kcAueaXaw4b4gI5y3yKnVskR+D8YI=;
        b=DpYChT5eqqHCQDrU9St+YyVX+hefwksBy0KbkKp11rQQ7zSCiw3YHDg58hJk8ikQop
         e1+WFS9p6ZQxHl4w00r9pulRbrbXNCGZpl8IKipw7Orv165BWYYhgqrQfwJIPIkhmFYH
         bNfACooXEXkRt5pSWQNi1o3lhwTWtwrDf6hWiCEObtIlBXBRtIOqT+m7jhksNjiYaDnq
         6+XqmZcFnovgbycSq4msMTPzOf9/4Hz5lsgsZwpJLyDOFDab9N8RIRHoozOAP9IafNpI
         lt22V7WJWAjPehRWMvF+diWdwHy0fl2JRLlGT1ax59VMHiF0n35lU4AXnjDLHf2HXCV0
         Ue0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767024081; x=1767628881;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8LjbcYN47mqFb8kcAueaXaw4b4gI5y3yKnVskR+D8YI=;
        b=KCPtWGsnSL0EagLXAAJRx/LVWirivPgJdcIRVLozPelQ+ENq5/g4e0KnumyAa3uiL7
         Y46CcJVyJW3baEBBWoPBNI15yIW2YpJqybuxCl6R99DVahtYmTKZpnTY6y+f8CdoOjI8
         8JMc0YaIPBqyxsFQ2vvL6qk/s2dDG8GW2BwzG5nDI6gvRqcjeUqK0mIGH1VwZFpS9cBf
         DxgEqJmwqCg0OpWVA5UpYAXPp+XgeACzMF/htuE5YMlR9GP1HkIPt5w3icteuIWB9mcJ
         0LPh5xFT+cT/H0HpASWa1OSh6P5LnaGD+H/qn10DosWGYn+8T4Oxpo6kUG7S2LLRM77F
         Pd4w==
X-Forwarded-Encrypted: i=1; AJvYcCVjfp1Cm32N9GtMv5Til0q1Rj0T2I5RbpEb7dC9eJk+333HIsPFfQ6iNFGK35mOQFxT3uvbRPnYsRU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMjmWAd+4dsqhTSRRikyAyGV8xoSJBMgrgZitMfge8dJQn1Q5u
	oYP/hB61wCgOcuO2Iy9T5QVVwfMlEWA0JYv6ppU9j6ZudjZ50tLetw5s
X-Gm-Gg: AY/fxX7zXPmlcduKsQ9QCwcQycncMiidmnrkn6ILO9oDtvCdm8CZCIRcB92ku1A9h0L
	18I2j4WjITloxwzqwtd/1Qzdk0O0DG22inGJFTUpFtJtEYXmtqKdW/f1mkwD1CU/GbkGwBEThoE
	9FZ0Jw/XkDaIKtRkCgVsfkgTGZ7wbY6PUmNGh5oRLHlEUs2xQYzKuvERgf4ObrBx6mvg4xqMT5R
	bsu2Au3ZVjALOxAW2AaghBK81PAo6FdZ7dDCAuCs/q57cQaN7AvCiV5FTKTSvU1+QxxVhavRFTq
	uH+hojFLWjamJhen9UYJstrsob5NPn0+UG2Ye9EhggEZFM+Ik1eHlU/B8Mm7z2VayaAR9mglQN0
	bKp57B6you7Y/fiIuzCiY9IgHGTNCyO3DaoXWi/e9nNaB9sPnVKB4xkWbHiKNexvWuDhnWUyy4o
	RTkaD9eSWuYA==
X-Google-Smtp-Source: AGHT+IG8r9WGqtQs5PDLA17aHT0Nt7VdXa7H/dy+z+rwuC7NprcZaWZ3olPk9c8OqhtGcrl17FlxDA==
X-Received: by 2002:a05:6000:611:b0:430:f255:14b2 with SMTP id ffacd0b85a97d-4324e4c23f4mr37935652f8f.13.1767024081303;
        Mon, 29 Dec 2025 08:01:21 -0800 (PST)
Received: from fedora ([94.73.37.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa4749sm63847647f8f.37.2025.12.29.08.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 08:01:20 -0800 (PST)
Date: Mon, 29 Dec 2025 17:01:19 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	victoria@system76.com, sebastian.wick@redhat.com,
	thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 07/33] drm/vkms: Introduce configfs for plane name
Message-ID: <aVKlz_6knC3AgRS4@fedora>
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
 <20251222-vkms-all-config-v3-7-ba42dc3fb9ff@bootlin.com>
 <DF5JW5Z5K9YE.2PCYFIFFMT6G6@bootlin.com>
 <da5db513-1b0c-4ba9-8513-a616895405de@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <da5db513-1b0c-4ba9-8513-a616895405de@bootlin.com>

On Mon, Dec 29, 2025 at 03:40:23PM +0100, Louis Chauvet wrote:
> 
> 
> On 12/23/25 12:14, Luca Ceresoli wrote:
> > On Mon Dec 22, 2025 at 11:11 AM CET, Louis Chauvet wrote:
> > > Planes can have name, create a plane attribute to configure it. Currently
> > > plane name is mainly used in logs.
> > > 
> > > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > ---
> > >   Documentation/ABI/testing/configfs-vkms |  6 +++++
> > >   Documentation/gpu/vkms.rst              |  3 ++-
> > >   drivers/gpu/drm/vkms/vkms_configfs.c    | 43 +++++++++++++++++++++++++++++++++
> > >   3 files changed, 51 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/testing/configfs-vkms
> > > index 0beaa25f30ba..6fe375d1636f 100644
> > > --- a/Documentation/ABI/testing/configfs-vkms
> > > +++ b/Documentation/ABI/testing/configfs-vkms
> > > @@ -103,6 +103,12 @@ Description:
> > >           Plane type. Possible values: 0 - overlay, 1 - primary,
> > >           2 - cursor.
> > > 
> > > +What:		/sys/kernel/config/vkms/<device>/planes/<plane>/name
> > > +Date:		Nov 2025
> > > +Contact:	dri-devel@lists.freedesktop.org
> > > +Description:
> > > +        Name of the plane.
> > > +
> > >   What:		/sys/kernel/config/vkms/<device>/planes/<plane>/possible_crtcs
> > >   Date:		Nov 2025
> > >   Contact:	dri-devel@lists.freedesktop.org
> > > diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> > > index 1e79e62a6bc4..79f1185d8645 100644
> > > --- a/Documentation/gpu/vkms.rst
> > > +++ b/Documentation/gpu/vkms.rst
> > > @@ -87,10 +87,11 @@ Start by creating one or more planes::
> > > 
> > >     sudo mkdir /config/vkms/my-vkms/planes/plane0
> > > 
> > > -Planes have 1 configurable attribute:
> > > +Planes have 2 configurable attributes:
> > > 
> > >   - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
> > >     exposed by the "type" property of a plane)
> > > +- name: Name of the plane. Allowed characters are [A-Za-z1-9_-]
> > > 
> > >   Continue by creating one or more CRTCs::
> > > 
> > > diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> > > index 506666e21c91..989788042191 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> > > +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> > > @@ -324,10 +324,53 @@ static ssize_t plane_type_store(struct config_item *item, const char *page,
> > >   	return (ssize_t)count;
> > >   }
> > > 
> > > +static ssize_t plane_name_show(struct config_item *item, char *page)
> > > +{
> > > +	struct vkms_configfs_plane *plane;
> > > +	const char *name;
> > > +
> > > +	plane = plane_item_to_vkms_configfs_plane(item);
> > > +
> > > +	scoped_guard(mutex, &plane->dev->lock)
> > > +		name = vkms_config_plane_get_name(plane->config);
> > 
> > vkms_config_plane_get_name() returns a pointer to the name string, not a
> > copy. Unless I'm missing something, that string might be freed before the
> > next lines, where it is used:
> > 
> > > +
> > > +	if (name)
> > > +		return sprintf(page, "%s\n", name);
> > > +	return sprintf(page, "\n");
> > 
> > So for safety the above 3 lines whould go inside the scoped_guard().
> 
> Good catch!
> 
> This also raised some questions on the whole locking synchronization between
> configfs / config / DRM core. I will work on this topic and maybe move the
> mutex / add a refcount to vkms_config.
> 
> > > +}
> > > +
> > > +static ssize_t plane_name_store(struct config_item *item, const char *page,
> > > +				size_t count)
> > > +{
> > > +	struct vkms_configfs_plane *plane;
> > > +	size_t str_len;
> > > +
> > > +	plane = plane_item_to_vkms_configfs_plane(item);
> > > +
> > > +	// strspn is not lenght-protected, ensure that page is a null-terminated string.
> > > +	str_len = strnlen(page, count);
> > > +	if (str_len >= count)
> > > +		return -EINVAL;
> > > +
> > > +	if (strspn(page, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_-") != count - 1)
> > > +		return -EINVAL;
> > 
> > I see you effor to make this as clean as possible, thanks. Still this is a
> > tad ugly, and should be moved to some common place at some point IMO. For
> > now it's fine, but if you need to add more user-passed strings, that could
> > be the moment to move this code.
> 
> There are multiple "user strings" in this file (notably group names), but
> currently without limitation.
> 
> I can create a tiny helper and limit all user strings to a-zA-Z0-9_-
> It will technically break the ABI, but I don't think this is a big issue.
> 
> Do you or José think this is a good idea? If so I can extract the helper for
> v4 and send a separate series to do the limitation on other strings.

From the top of my head, I think that at the moment the device name is the only
user facing string that is not limted in code? It is limited by the allowed
characters in filenames. But I might be forgetting other custom strings.

Technically, it'd be an ABI break... So, while I think it shouldn't be an issue,
I'd prefer to avoid breaking the ABI, but I leave the decision to you.

Jose
 
> > Luca
> > 
> > --
> > Luca Ceresoli, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> 
