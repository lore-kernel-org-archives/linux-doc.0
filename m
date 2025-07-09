Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529501EDA2F
	for <linux-doc@vger.kernel.org>; Wed,  9 Jul 2025 03:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752031626; cv=none; b=ZSbeeaFmQLalzLKexiUztooZuG+zq9DPeGEYaonDEAmmhqeL18ua0jcPhkDR3Wa6VDVuqdIjEhynNCHfzm96zMktAB9ySwxRtHFdkBz5dp0zgOlqOMDlpKT4GdldY8mlkdVsu2BX7Y+LRQP+eP5rBhx6kXA1oDBXAdcqE7vpKh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752031626; c=relaxed/simple;
	bh=zw/fej0GkXW5A++Ge3FEYjbMmbv+hTBMbj5gw+U4//w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LP3gaKTmvYfdE/KqK+cVWJe3cJiq9xeeDO+/zybhAHfVdHsOGmQ6vJ8dbxoKoXuF291LRiTcbJyaQCcNNH8kiLUhg0yQFSKOEUD7rWDnETiTSACtXMeJVQ7Eunql+r0vz1ObavW1u+zV8GI9CxsyARrwqNUv8VeCd4PViGf9xxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=KXQxlaqY; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="KXQxlaqY"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4a58d95ea53so7336761cf.0
        for <linux-doc@vger.kernel.org>; Tue, 08 Jul 2025 20:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1752031624; x=1752636424; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zw/fej0GkXW5A++Ge3FEYjbMmbv+hTBMbj5gw+U4//w=;
        b=KXQxlaqYQfw0jkMx0UszkFkz6yZAkJym2Y4XdWw6DJwfxo7h8FDx3GciGZ4GfjpWq7
         2by7ourxfJDrIk221f12+zzD98YK2TkxAwAEVam8W15bHr1Mj1EDYPPa85YXU51sAsSQ
         /b/56IISOz1C8GvDDn5t0r5YCFfLOOHuTQUNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752031624; x=1752636424;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zw/fej0GkXW5A++Ge3FEYjbMmbv+hTBMbj5gw+U4//w=;
        b=HpbOL0r/N4kuul6T7f9FUUYUCEAHfUqodZbUlLoENqxBe2BLLEYzZDbepwzfRCEv4x
         NxOOV6RBIbqIG9KwN4c/6DWCE44+MX39mw/EduPvd65htUbVJa+SniDU3Cm1Zrgn1vRp
         tsUNPlPcm+Aq6i26TzvvZClRdI7cGU5hQ4egoC6nHOWtWx5X/En7fPGLCMq2aMnBRdXn
         FrSYXQ16xggmya42n++QCFuExpr2JnxDEjwWW9bOxeuLuQB2JKyX4b/4kxibEhQOe8vK
         bBLiaJ8c8lp4ljyf7CE48r3PeYSe4NxZpSjgsWxaUXygEgv4jCNsKmDbyyK0gwWVk41h
         MwTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmly/g1wPk5B1Es5bMV+wktFMh7Nh13+5FEtcQu0vqDyzGzxomppNvC6zKNUHos8A38HEZB8C5I8I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuNNpN0wdVz0z3j1UYpYA8Cs8zZA1sjTTljnz7sh7vdElnOgSH
	Z4vR4E3KchqA30PLI3Gw1V4OCkQGILMxKcfgraGdR6OCcsvuLJMBt5q18VcjcPtYgrxnMcdklSn
	WvSU5Fmu8Rp15q+d10WkxftlC93dRNqDATRqawrK3iQ==
X-Gm-Gg: ASbGnctbF2hI18jIcN54H1r1o4Cai4tWTnT8Ow6p1Gop5kE+w8clne+hXUh1X2ltOLW
	1HojwzwR28b44F72j1bWcYC+QcFzs0MVFW2NJIOTTgUJt82Z4OlzOCXQUL9sWlqlS25y8Fb1xPY
	E6h4EKU3eZ/egp16CvsgZuqli6EUaliGm2s0M4uDcosF+k
X-Google-Smtp-Source: AGHT+IEbfuPtiB8SJ8mM3IIy/0e+1oWhx4UxNRjIANMV3UTN0UVNRrT4FqNMCrH6Q0szGd55OwaVpm23wRX15i4H4tQ=
X-Received: by 2002:ac8:6f19:0:b0:4a9:8b58:6300 with SMTP id
 d75a77b69052e-4a9ce5bbb43mr86267521cf.16.1752031623903; Tue, 08 Jul 2025
 20:27:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703185032.46568-1-john@groves.net> <os4kk3dq6pyntqgcm4kmzb2tvzpywooim2qi5esvsyvn5mjkmt@zpzxxbzuw3lq>
In-Reply-To: <os4kk3dq6pyntqgcm4kmzb2tvzpywooim2qi5esvsyvn5mjkmt@zpzxxbzuw3lq>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 9 Jul 2025 05:26:53 +0200
X-Gm-Features: Ac12FXw6hgYHynMi-MN39oWlDifPLmPqesU1MFQWRlURFDaTLnL4XYV-SQPgaEw
Message-ID: <CAJfpeguOAZ0np25+pv2P-AHPOepMn+ycQeMwiqnPs4e0kmWwuQ@mail.gmail.com>
Subject: Re: [RFC V2 00/18] famfs: port into fuse
To: John Groves <John@groves.net>
Cc: Dan Williams <dan.j.williams@intel.com>, Bernd Schubert <bschubert@ddn.com>, 
	John Groves <jgroves@micron.com>, Jonathan Corbet <corbet@lwn.net>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	"Darrick J . Wong" <djwong@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Jeff Layton <jlayton@kernel.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Stefan Hajnoczi <shajnocz@redhat.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Josef Bacik <josef@toxicpanda.com>, 
	Aravind Ramesh <arramesh@micron.com>, Ajay Joshi <ajayjoshi@micron.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Jul 2025 at 20:56, John Groves <John@groves.net> wrote:
>
> DERP: I did it again; Miklos' email is wrong in this series.

linux-fsdevel also lands in my inbox, so I don't even notice.

I won't get to review this until August, sorry about that.

Thanks,
Miklos
