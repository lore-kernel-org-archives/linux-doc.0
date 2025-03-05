Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726CC1E50B
	for <linux-doc@vger.kernel.org>; Wed,  5 Mar 2025 00:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741135738; cv=none; b=hCtQ3Fid8tVXxVGIy0IJS4DiJO/Up6U9ft+14ypMPESRxbsr9InEWNG/6t1T/v8mI+iErYDJzkam9tXAt5EywmCd9qwCCv+tSUABoq7nnvNbyEe7OlDiENFsmW+7OSkC/oDAk9+u/IByH0QBiLoJElDVwQaDbfN0+GePkOs7iI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741135738; c=relaxed/simple;
	bh=tjTvQE048fv8PKJNsWXXOTWVGYT4qT63Flj1AfZdvI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PB1XzR5h6lWQqkY5xpFwH8cDZ9pOTdmZ3rGuRnQLxw+QMmL9hUBBBUJch8SIOvALaCyWpNnM0TbzlmzJtv4jxTbHjVw0zY3s+bY3FHHgA8ksD2c2mXI867jgupvJDVYcH6cVyhnpHmv/6AnENNO68tin0Flp9O3qW5kapyuZGus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com; spf=pass smtp.mailfrom=gmx.com; dkim=pass (2048-bit key) header.d=gmx.com header.i=joshuarose@gmx.com header.b=Izg4rlH1; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.com header.i=joshuarose@gmx.com header.b="Izg4rlH1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
	s=s31663417; t=1741135733; x=1741740533; i=joshuarose@gmx.com;
	bh=orAPi4vl21rOodR/Ni9Q5EYFJ5Tj3xgVSnMzCsewzr0=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Izg4rlH1V71p7IpaeFRoXXVbWql+9nmHviBXawmY0QT8+hHOIpd7s/FgvGiQGWv9
	 ygqZ7VjWT6MvUdCvP0G0tXUOylv0k3bEybcJ2cHsg6TDjIJ/EevlVmryeZC926aJT
	 PoG8Ooat8Z2TNkKANta/XeiQdTjbP472MQdllZY5GPk4OQb2SQJUga31TuHEnvAab
	 89CoqiMQAV27PCZ2ipuSGqMiV5syBCzqNWUrAECaFirhvLJcPycwuqm6kgYSoHAIB
	 +1BKiiVGBfeAselLxU3jIku2YZXRwYzAeHRKMfMdYcXz2Zt1DRAWZRW497GdB/2JR
	 idKul2WZP3f/wtxSYA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([122.107.8.54]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1McY8d-1tH6TJ1KDV-00ffGD; Wed, 05
 Mar 2025 01:48:53 +0100
Date: Wed, 5 Mar 2025 11:48:45 +1100
From: Joshua Rose <joshuarose@gmx.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Joshua Rose <joshuarose@gmx.com>, linux@leemhuis.info,
	linux-doc@vger.kernel.org
Subject: Re: Grammar issue(s) in documentation
Message-ID: <Z8efbax_VgGBzQrl@spinny>
References: <Z8Y-FHZ5tYBEMy4j@spinny>
 <Z8ZdEioHt184CYNm@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z8ZdEioHt184CYNm@casper.infradead.org>
X-Provags-ID: V03:K1:334IWo7aILqlO9ehcKx1iNa/eQU2wEfigTaCrGcOM6SVLMmshka
 xg8CU7DUEBknBTARM6e7vBqUpLu9g8IrrMbnFizUtc36s0ggt5lDtnmRNgIGVrfxq0mU9Iw
 q+JFmWg+Owyo1+qPTKyzwNBLsQaFhny1aPbOqT9kSDAiH/cxT+mvOW5BDEuz2F+AHpmIkOx
 wyX9QWMgSMNmH5F8sQWYw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:s+9XDzHyUy0=;e8ASrOEY9eGXrjXcVcUVABg9ufz
 twUW0A0DeB+nHlD0r1R+KaDOe4M5l6X5E+fcnGWAlDjzsDNgBk7owMC2uFl7jrIcoWmzAyQMq
 8g5DBRpQYjAOBqP3odHdjJ0mlcfuByTnxDR6/q4h/fFTelXF8n5/E5EL7/H4ZhT1eIsdDQ9p8
 m7FTz/wl0zw7ZYbyE38AQZLlYFeXAkRGPfs1xJOwTwfjT2J16xYuIEELgH9BspYuOVCwDHqjR
 bQgHl5FE347XjACqdaXURMyYRVaFvdV+X/cK6MJI7V80mxtfu3/xZQESbWvutLslaaM8iXXYK
 nbFXW/qMTIxTwJ+QBdFSxCZqi+AoeyJv8p54lKg5L8Fru6Y7I3Fpaty9O67L8XCkUcoHJ/+lq
 lFr22FSkJ9hJlpa87CF1cNKDYPXJgHVmMXmL+McAqAI3PHgtUU50xITVikiFeN1l85Qs6kCN5
 rb5ttBIbjJnum14B4DaHSGh1jsvkmqeOXHvYlHWrV4FgWz8RXaBSBme7wvldK1ieTlXhJ8Jkx
 i+LP1+iPnkKr0kZRgb6NtUt3Fv78mSlF5cLUGWBxeJ1GS2juC+I+xr2EpmR1u0lKs0lO3zooK
 43NpIByunjrwCYfu1tcEozqfaH78V1jp112HmsJ1fk1NTItr031+qohwkvM6bjmaJ+UE/HBCH
 ZEdpOogGSLbLTBGTkQKo4YYvg48tDXY2NZcjLCN17f4GypExzWw4hDV1zXc+rPoyIgMmXkq/N
 1AeSnVvd8/ABHCBX2mi/R15uo7k9PzDIEeWZw0+sCXE+ry6KwY9+4YwS2UkIyi9qToj1Z3ons
 twiIimWfXuQmR4GCW1ywvaNYDNc5j8YRWEhHRjTJmduXk1H+g5pQwEt9Sa3ciab/OESkEUjNI
 lPpwp+/wQKJkmYkh4Ojh+uG6VsogavhMlHqrjtYcskTL/0a4ei4eo1VfnGVG1dFaUKPq6upsd
 rkE7A3c+gW/XoLh9anAzaNFPX9h4/fkSxWABDK88d5xRpU2LfbHx57eWA0yOi3jxhaDS+VEku
 JinRSCxXG/dZ+29TlGKZ6Y+S8o/ouF2ven1Gc3CrBLSBE6EDTzwapCJ6ZT6OjGltEazEenU2S
 EttT33xObLi92lzQY3LXMWzJQAycriqhwyvQW6y/WG5Q5jRWaQjNwE3BXtp/x+Y8sQiQd19ER
 9HEKFax2oHUZwXzbXNgKApo3lKOEyjunWNtq/D74yOtFjBgzsTsdHpuCaktVBT+ZiGxCa8SyA
 0lI6HjJzs5IRK1bomdnKgZQNXtdO/XCJVUJsPvKHd8HvverkxE8HXOUU0VPbihYLhKJszQmAQ
 XBJ+vpLMgS7FVJ58Id/7OMYamNSje+knabN0FLtRqKIrs2BWDt7AcqfgDQyZnc37z2OXt9fAp
 /00YvR0URDN799nYLrKxt8pO4QKWWrP7VDgvzUJQgqn3aAZzzS2r6zCsci
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 04, 2025 at 01:53:22AM +0000, Matthew Wilcox wrote:
> On Tue, Mar 04, 2025 at 10:41:08AM +1100, Joshua Rose wrote:

> > "Do not attempt to circumvent your distribution's packaging system by
> > installing your kernel manually; this will likely break your machine.
> > Components of your kernel can be selectively removed later on.  Such
> > components (files) are stored in two locations, both identifiable
> > by the kernel's release name."
>
> I think that's the opposite of what they meant.  I understand it as:
>
> "Feel free to circumvent your distribution's package manager as it's
> easy to remove the kernel afterwards".

Oh I see. Okay, well can it just be re-phrased as that then? It seems
much simpler.


Kind regards,
Joshua Rose
