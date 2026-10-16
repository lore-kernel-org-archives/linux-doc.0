Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4254ED199
	for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 16:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792168772; cv=pass; b=gBgm1Wzd+9BvU6Es2A+FjyrUf5dhOMvNrVgpigEqz+AW9Pvtlh4+HMER1dQCzdg0bQZAjI40YUzD0zLJaQIRdHMEGF0T/VTNrRL8gY/L+HWxkLjnmOivKUymUN5a/GGDhWlfhZbESabaEqQkrLQQ+G7EahR27BwM9XaqoD/y6Ww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792168772; c=relaxed/simple;
	bh=GYZa+WYjfY4q7qD6twJL6utNn4fuZ9ttx5FDCieufDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TMglxaUYxs3e3+1e9ywZbkEuUs0TB5u27FTQLUEzbmjT3LhMuw2fEkc2Hnba6SW3PQul8X2JJiaCueuUZyrdkRhRo4WLS0CQLDDKEbX+winX0zX1of0T73nluj1tw9xQcgL9NSZkU1oULXR244TlpKSpBq0kqHEH79YfRWHKUJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XBLiA8Xl; arc=pass smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XBLiA8Xl"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93f1cd0b004so12013885a.2
        for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 09:39:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792168769; cv=none;
        d=google.com; s=arc-20260327;
        b=iAoCxEj5fTSecXqulySsQV+HRkV4npETbQeLsYqaJvX0sJYHiCCvy8BR2zC6pGMd7U
         cd9v+OHDsBd53KP47xJeMMvlKsOcjib5/8fqG24VcfxX/9U72qZmTfLlwBeDLXr2RVrV
         /Onv2FTe85/6FTrg7KmEyfPk+LxH+caeQHJ806rECcSJ4yWX5qFbkrNm1P3bWZ8g5bnC
         iCB5S6x3xge19PsuB3bY4y+frG/CViMRUIh8/47rtNHoqXuiQaBQBzKF0OdlbCSD++3E
         ZsBbZDZPw15+C3H7Zg8M4hsBbDaWAOMEnECExEjdLE5jDsoAzof8e3uqVuO34HdRFM57
         h3rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AXnPIgMXiyBd1h2THh7HTsYWO/OramMboVGVD9BzIk8=;
        fh=6oJZIqVE0RNO3n23EHQF9f7duGG2THALGAiJH8kYl/c=;
        b=RJkcO8VJIStS711BRUutm3nyo9x8+Hw+XFRrG7KSCYMtqBImi0bC6cY9XVl8nqIixr
         4Fp1srHU7KURFkM0KdU04Rf70E+l18uOpSNMUGTPsFGmX9uzImsngfNLFnuIGHQQkgZI
         +AGYVbss/vb0hl22mDb5bH5a2ELJjekBM//ZKD2bnhoB6YFvAzu0WSkD4NREqdxkhmse
         OGnEzMmc9729oxuajwq/HIpCsslPfD771umGg996zcYa0XLfBu6oQviS9fNBOBd9Vbpu
         K6ct59Ez3pemU1O7sUNM8uUBZ/eaNhZMCN1eRGDw/G6yeWSJDt6z8zDLN6jz+ebkojC6
         x0rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792168769; x=1792773569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AXnPIgMXiyBd1h2THh7HTsYWO/OramMboVGVD9BzIk8=;
        b=XBLiA8XliZKkW3zJdWaMAxNTsvlCGvsyWdTYwW3nIJCs0bCr+uBm2maybYrtvNkvfd
         3aCMqBRIqnCcYiPP0wQqXniUENZsyxZekOY5B0nWfDoWs0VSMwHJSeyMuEI8pyhimfB/
         jyz6OgCHUJGJU2O5Paq/q1AfrY2aeHFnSJLdikiB1x9XYAwOyS8ON1tYx/7ZKCrOwJaC
         9xNf0Q9RTptQd+UOAkPD1UKo2VRCoDIEBWQeNOpHMIGjotfBHpO3hrOqUpvp0ejpQag1
         TNWHUcmgIWujwMTYg43NP1AuLDIuR+I6LCSZRu8J7W3pkv96n5UmJ08+YDJbAXbjrzLr
         8HBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792168769; x=1792773569;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AXnPIgMXiyBd1h2THh7HTsYWO/OramMboVGVD9BzIk8=;
        b=wZelSYQJCdySDE+4w5Oaj1+2cfu8skedylsdTNEO6rFh2DVaqYNeM1zrocVPqCCWIT
         +A8i6c2KQyGypQ/Uo8wm7XJDpjG76BETBfmgOTSCIMKApE4TcNwhLa0sTu8LWnftvNe2
         SeZ5AGHOpg0AXpl71O6LaREZlVa6D9cm61enCDQRaekbnpa9WTOjU6i0fSot2OsHtffy
         y4pfjGIefqBpE2CYyAE37iiECxqLxRd80SmgltnZ74IGSJ/OesA/F99n5N1SV18I/soE
         K/d8mJpzwhwCd6Fz73lao5Vp0Yw9cWwPJzio1zL4u3782ZdS1Vazq9UBKOtfrkMy63Cp
         O/jA==
X-Forwarded-Encrypted: i=1; AKwUvBw8/eAPMFqvWCfkkGsSbt54rzgTBQDPYQNBxlUPtUpiXaxGEqsbASIzQCa48gWdP6W293mI807aaXY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3ZERQbi336OrsmpxvX1HBuQeP2xMNyPqBzC3ebA9ZqayeD2uv
	MinJf3ehgjdJmw/ibGP98lcThAt3ipsj/aLAAMQWnAep3bmfGAbuF6foPMmfwIN1bjbeho4Ylf1
	5P0VDibtcU/GTjEecO0vkUUNwXSC83vU=
X-Gm-Gg: AYBFou1q4ns0dCTXAb2FZ9s468QhZhUYBeO7ThYB2YKqqB1/egsujFzsNhM0Uuwo0i/
	c02T4LBT140fqOwhFCZqA+3dMhPMLDq3gp3cN8zrz1E50AN1cYqodufmLkxljchS6ptNoC30aFf
	80GwqWBvlOsQ9PZKNL9UAduYpfZUv0Sl/KlADUtycxPqoUEbbWGZ6DXYXINTXI5NNNrgCr0e9Vg
	zxlt3K8azWKAn/iU2tY4H9rY3O6ju79DhE/PJCS0taPaRUIsuvGZypHUlGvv7EJkTY1UsZkhJZW
	AFEt/ALiWBL9IhegrF1g4NfWd+E5ai22Dtl2EEXHeL1G9226Gt8W5N37devcGQkhiQ==
X-Received: by 2002:a05:620a:258d:b0:93a:f9:614a with SMTP id
 af79cd13be357-93f29d3838cmr70178285a.34.1792168768959; Fri, 16 Oct 2026
 09:39:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014233318.34567-1-heyheyco@gmail.com> <a0fb773d-dff3-46d0-9bc6-f408049ba12d@roeck-us.net>
In-Reply-To: <a0fb773d-dff3-46d0-9bc6-f408049ba12d@roeck-us.net>
From: Qian Xiao <heyheyco@gmail.com>
Date: Fri, 16 Oct 2026 09:38:51 -0700
X-Gm-Features: AclHuK_bv1MWXz6zynnaQJQy2jLr00--eLrquQDSSFo031ibxp4R7aAroGr5hV0
Message-ID: <CAFGXJCn6ODtgLtnCSgciVWCaXQCYHXbMfPKBCR+-XSjT31Do-Q@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (asus_wmi_sensors) Drop misleading BIOS upgrade advice
To: Guenter Roeck <linux@roeck-us.net>
Cc: Ed Brindley <kernel@maidavale.org>, Denis Pauk <pauk.denis@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, that makes sense. Sent v2:
https://lore.kernel.org/linux-hwmon/20261016163509.249020-1-heyheyco@gmail.=
com/

On Fri, Oct 16, 2026 at 9:09=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 10/14/26 16:33, Qian Xiao wrote:
> > The Known Issues section suggests that upgrading to a BIOS with WMI
> > method version two or greater should rectify the problem. However, the
> > driver refuses to bind when the BIOS reports a version below two, so
> > every system using the driver already meets that condition and the
> > advice does not help.
> >
> > Remove the sentence. While at it, fix a typo in the preceding sentence.
> >
> > Link: https://lore.kernel.org/linux-hwmon/CAFGXJCm6ZWK0NsFhZ1_ycgYtTTT3=
nhqj9mose60t+Rrry1aPvw@mail.gmail.com/
> > Signed-off-by: Qian Xiao <heyheyco@gmail.com>
> > ---
> > For context, the fan issue has continued to be reported with the in-tre=
e
> > driver (which implies method version >=3D 2), e.g.:
> > https://www.reddit.com/r/archlinux/comments/tunnvb/psa_if_youre_experie=
ncing_weird_fan_behaviour_on/
> > https://forums.unraid.net/topic/131340-semi-solved-611x612x-bug-system-=
fans-stopped-after-a-few-hours-asus-mainboard-linux-517-driver-asus-wmi-dri=
ver-issue/
> >
>
> Then maybe the advice should be changed to "upgrading to a more recent BI=
OS
> version might help" instead of being dropped entirely.
>
> Guenter
>
>
> >   Documentation/hwmon/asus_wmi_sensors.rst | 4 +---
> >   1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/Documentation/hwmon/asus_wmi_sensors.rst b/Documentation/h=
wmon/asus_wmi_sensors.rst
> > index 8f2096c..f6fa66f 100644
> > --- a/Documentation/hwmon/asus_wmi_sensors.rst
> > +++ b/Documentation/hwmon/asus_wmi_sensors.rst
> > @@ -72,7 +72,5 @@ Known Issues:
> >      X470 Pro seems particularly bad for this. The more frequently the =
WMI
> >      interface is polled the greater the potential for this to happen. =
Until you
> >      have subjected your computer to an extended soak test while pollin=
g the
> > -   sensors frequently, don't leave you computer unattended. Upgrading =
to new
> > -   BIOS version with method version greater than or equal to two shoul=
d
> > -   rectify the issue.
> > +   sensors frequently, don't leave your computer unattended.
> >    * A few boards report 12v voltages to be ~10v.
>
