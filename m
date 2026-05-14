Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905993FD13D
	for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 15:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778771361; cv=pass; b=NouVymgpbGS6/t6Hx2KLJL/D5L+gWCx39pI3e2HD9YXqBosCnOKfeSN8lVrxdWRQgp3UaKcsDD0F3vzL5Vhj7dRVMXmjcDWJhSWpTFk4emgmfrc9BWjDuiMUKgopqw7o7UCOrnSn1LxtFfWE3s7n9dqDzoSJ1i1uR6ycWhcqUuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778771361; c=relaxed/simple;
	bh=9VWkUyUAPDFo9IHMN2LN9rQ2SLm6OqvalmrrIvc1kBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Au+Rm3xS/PlcDZWLsXeQ72DN3MCKF1uWNfHJngZ873YH84BAYavctUKah7uI/vn+8+3ns3alADu7ylpGBnhjLQfWTdacZvZaIwCCBPk7otQbnGJCK1+GGavpo4IH9k4HPaQjO3+ZYw8y5eDqF6IU5tH/Ktkg1ZfWKRG4+KZj0tU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLDXNifw; arc=pass smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLDXNifw"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6949e5171acso392869eaf.2
        for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 08:09:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778771356; cv=none;
        d=google.com; s=arc-20240605;
        b=UcdbPiykY6hauMe+j43/Go+bQd509mz2gdzjG3AUVrxjIzm4SynsPJGvnikPrUKyK+
         bRt1+SqplRl5UhytD8EpfON76rHZnrruTH3tUtJwl2Nb4h5aYyOvKlGI8hvocwdGQWX+
         is3n6ubzqIHhZrzq3hKsUaCDECZrDSrUYBuqzH6sepUKu2f7m5MuEULFoISvp1kBEK6n
         tdj7gw44hNiA561FDfjyZmIkvP/NBX5fTfpTCLhQ4E5AVjdKaIhWyCOJY82CDyY3M5cL
         eG9GncKb+n2dx8MKMkH4z3hR1TnOw8fpcBWLSdNAnBg4U3eG6+0MmpNp2SO43mJNz+xy
         uZXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ESax1I69XZe2pTasflsIowumfd1TUPTULL6KM+u28lk=;
        fh=j50IIaQNXs5U3Aa9IdmSsGMAP4BZ+AZKBD9kiekIO2g=;
        b=UfMl6vXWeEtN1tUPVFW0hCNjf49RWKNDw1GUR7nQHyhrmofxIGBO9v6yvRMLvcyrCi
         l6/eWO0u2LgphQ6heHjh+3+pOJM/p0BwapKJ+W5nxbGw+v4V86Wr9l+VjlESy+i6PVua
         kwkRhjsbu0g2hP2LX+qltpL31qxey8+6/wFO0JVit/It2MOpG5UIBK9wzUWx1PwLNBse
         NSi0ifq1DU0pjeVh3dcVrrr3YzHik9/I50qmCnvFk2BLne1FTvLKh8BjE5Sr/fDu0+UO
         Ei1HilaPqHtrCNjhGVkisvOU9kuUcICUjyB+7Gj7u3iVz3MOCYJ3UGc68oiO5j5Wy5Zu
         DPlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778771356; x=1779376156; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESax1I69XZe2pTasflsIowumfd1TUPTULL6KM+u28lk=;
        b=VLDXNifwsMc5/mMekoJ//T+3WJCaZdjKoCkJx5NmxWmIBBmNllyQuJL4EhocCbj5dR
         1nWKA/W/eMhGB0zPN+urRi3E4jkomT8b29gr/FRPEbOvpd584AV3m5pNOoDVTtr9nvce
         K7ikz5zD5g8evV55F3jLFdwCXUu2GSsq7e6xS5XJcXAUtA+bkhKFexoS20esMq6TCZfe
         C6fbxfmYr4+UBSEl59nzZpc6bKrMiD/W9+OK8jGLfN1p4lFBu/rh+pxfzoglpzQbOkAH
         AShoPm9ZXNahDbfSEEoC+7cwWjl2WRlsHNwzzJk+heg804RU0FyqAhHDqyiMHQV/jXxV
         a0MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778771356; x=1779376156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ESax1I69XZe2pTasflsIowumfd1TUPTULL6KM+u28lk=;
        b=Tq29xv1AEMOnaSO+yQYG8FMK2jQJrw7k+FeyPjJ/bIIRrVL+kZlMSlhGwffSpLoNhI
         KRBXCRvdhdPZclQIZfMinTTBxK/SSRR/YE6gr+kfJlyjtuo4LktXn6+tvr5aJU3Aoomn
         izZEF3hk5OyFDiXL19+SaEZWaHh5cy9pfDYa5OCQnyKEeuLxvWX5SDdmna9aR2QWrb65
         w1UieE6RNelC7yVuSgZKW5ts8Km2jIlPpw4IQfcZRKGUfKzsi6qXi9tDb6pJdeGdJmop
         sUvKN009AEniymY9eZtB952URZKlmB8R4GlXINj3hDusaRyHZIgSygB027sx92E2texw
         pqzg==
X-Forwarded-Encrypted: i=1; AFNElJ8DVAAg5h3ATUsp6Oci0z11fJe1DIIJ/8GUfLPyymXUad9/jBZROlXsZxvPESJzrMWCMN5pEO85ZjI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEp5YU5zJIg2IZhVeDrp1zBskAdmDDiS68Ajg++cp4m9AEo0KL
	wyOZJw/zyAiGvetyb/jufou24h/74NfUEKcD1b3RgSg7XHyZLmTcdaR+CVXJvE+cVq4Wr2cf6O1
	016i1ul9iWwKeHT8jw4B+gYh9QNvboAs=
X-Gm-Gg: Acq92OEc7dYshVm2YO+UI/fIThXdYdyS0p41ilCSvVnLk8QsqNEAqTOjApO0OexNzf/
	TbXGUskN3433RBvcCOOwnf6WqbqpdeiWmsokBFl48HfXb/9OTBprbt8Ljc7/16GeViPtLxIuJYW
	AbBvb00FOVQJYE8535CbZP5+UaKGLcbdT1r/9OdRgDZLgHD0MLCfT1272cRgmp6YQPjhHJwbr+P
	lP+maAaML53uo3zGPq/x2tdv8a3GTVsUiZ4PjZkal696J5bvxWCYa5aZATtrA9etzmwde7198Y7
	rFSC9XbCo69HekiGBU0=
X-Received: by 2002:a05:6808:1641:b0:467:53b0:b44d with SMTP id
 5614622812f47-482b2d31b1bmr3042378b6e.5.1778771356079; Thu, 14 May 2026
 08:09:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514094955.76305-1-jianlv@ebay.com> <2026051443-exuberant-important-534f@gregkh>
 <CAFA-uR93Wf2ALpYnnU79kruv7XO=uFePqioaEXNNEfrUtRw2xQ@mail.gmail.com> <2026051406-corridor-equation-c50e@gregkh>
In-Reply-To: <2026051406-corridor-equation-c50e@gregkh>
From: Jianlin Lv <iecedge@gmail.com>
Date: Thu, 14 May 2026 23:09:03 +0800
X-Gm-Features: AVHnY4J2dkhFy6eGlghPANY01Lmp0sHVjJRnqMskvc_iSu6OzpshOwPJLL8rs3c
Message-ID: <CAFA-uR9=rHPbiVFYgDBAdRHCoujKjqtTxsMVupEwGhGmXoLw8w@mail.gmail.com>
Subject: Re: [PATCH] driver core: Add cmdline option to force probe type
To: Greg KH <gregkh@linuxfoundation.org>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rafael@kernel.org, 
	dakr@kernel.org, jianlv@ebay.com, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 9:49=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, May 14, 2026 at 09:35:08PM +0800, Jianlin Lv wrote:
> > On Thu, May 14, 2026 at 6:16=E2=80=AFPM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> > >
> > > On Thu, May 14, 2026 at 05:49:55PM +0800, Jianlin Lv wrote:
> > > > From: Jianlin Lv <iecedge@gmail.com>
> > > >
> > > > Device drivers that use asynchronous probing can cause non-determin=
istic
> > > > device ordering and naming across reboots. A typical example is sto=
rage
> > > > drivers (like sd/nvme): asynchronous probing can lead to inconsiste=
nt disk
> > > > logical names after reboot. In scenarios where disk naming consiste=
ncy is
> > > > critical, the probe type should be set to synchronous.
> > > >
> > > > This patch introduces a driver_probe kernel parameter that override=
s any
> > > > driver's hard-coded probe type settings and allows runtime control =
without
> > > > requiring kernel recompilation:
> > > >
> > > >   driver_probe=3DPROBE_TYPE_SYNC,nvme,sd      # Force specific driv=
ers sync
> > > >   driver_probe=3DPROBE_TYPE_ASYNC,*,usb       # Force all async exc=
ept usb
> > > >   driver_probe=3DPROBE_TYPE_SYNC,*            # Force all drivers s=
ynchronous
> > > >
> > > > The implementation replaces the limited driver_async_probe paramete=
r with
> > > > a more flexible interface that can force either synchronous or asyn=
chronous
> > > > probing as needed.
> > > >
> > > > Signed-off-by: Jianlin Lv <iecedge@gmail.com>
> > > > ---
> > > >  .../admin-guide/kernel-parameters.txt         | 27 +++++--
> > > >  drivers/base/dd.c                             | 71 ++++++++++++++-=
----
> > > >  2 files changed, 74 insertions(+), 24 deletions(-)
> > > >
> > > > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Docu=
mentation/admin-guide/kernel-parameters.txt
> > > > index 4d0f545fb3ec..b43a8bd20356 100644
> > > > --- a/Documentation/admin-guide/kernel-parameters.txt
> > > > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > > > @@ -1377,12 +1377,27 @@ Kernel parameters
> > > >                       it becomes active and is searched during sign=
ature
> > > >                       verification.
> > > >
> > > > -     driver_async_probe=3D  [KNL]
> > > > -                     List of driver names to be probed asynchronou=
sly. *
> > > > -                     matches with all driver names. If * is specif=
ied, the
> > > > -                     rest of the listed driver names are those tha=
t will NOT
> > > > -                     match the *.
> > > > -                     Format: <driver_name1>,<driver_name2>...
> > >
> > > You can not remove an existing user/kernel api, sorry, that is not
> > > allowed as you just broke all systems that were relying on this :(
> > >
> > Could you provide more suggestions on how to improve this patch?
>
> Not really, sorry, I don't think this is a change that should be done at
> all.  disk naming is a long-solved issue, to think that you can fix that
> by doing sync/async device probing is not understanding both the issues
> involved, and how we solved it already :)

Do you mean referencing disks via by-path/by-id? In our production env
they can also be unstable; this is an example I encountered before:
https://lore.kernel.org/all/CAFA-uR_jk6jCmf9DTebSVBRwtoLuXuyvf1Biq+OObqRVAO=
ZbBw@mail.gmail.com/

I understand that device naming in the kernel can change at any time. Howev=
er,
Is it necessary to provide an interface that allows users to choose
the probe mode themselves?
Currently, driver_async_probe has lower priority than the drivers=E2=80=99
hard-coded probe_type settings.
Could we adjust the code as follows so that driver_async_probe has the
highest priority?

 static bool driver_allows_async_probing(const struct device_driver *drv)
 {
+       if (cmdline_requested_async_probing(drv->name))
+                        return true;
+
        switch (drv->probe_type) {
        case PROBE_PREFER_ASYNCHRONOUS:
                return true;
@@ -876,9 +879,6 @@ static bool driver_allows_async_probing(const
struct device_driver *drv)
                return false;

        default:
-               if (cmdline_requested_async_probing(drv->name))
-                       return true;
-
                if (module_requested_async_probing(drv->owner))

Jianlin

>
> Hint, never count on block device, or any device, names to be the same
> across reboots.  That has NEVER been guaranteed on systems built in the
> past 20+ years.
>
> Please, just use the existing solutions, no new command line option
> should ever be needed here.
>
> thanks,
>
> greg k-h
