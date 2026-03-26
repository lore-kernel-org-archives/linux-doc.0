Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2573A6EE6
	for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 20:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774557841; cv=pass; b=jwDuAhZv4nQ3Q8ObrIRZwVv6BNslnXzDuh9V0aWwBzDSFCsKCD4flnvyU3wJ9u6MSYX0Si4sp5pjH7WAnRGfQrNiSK455t4SWvHDduve+srFkRlEkZWNxZztsUk0KjX3R/ywd62jA6Cr+DVxiJmG8dHRGkXS3qJePtg4ZTFwHUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774557841; c=relaxed/simple;
	bh=PeaSOVbGjvcbPrM1ej8GhDm0pQojiKvmqm8K/+z+B5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bRfdsfWqkKPeoakbfWPJUkSkNHVIqSXApQm9BIakK79J1D1QiXGzvsWeMNlzhUoUqFK/yc7TAd6Tk0htopMS97XrKXwSP4DqP5oNmSLZo8tgcdGdqhiGFiamHLFdzOyqSVGTr6ZR+zwlKGe1cHuNMg/9lTgGYNZ6ImIZ6hJGh0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=piX9Xtl3; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="piX9Xtl3"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a2a8abac7dso211298e87.3
        for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 13:43:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774557838; cv=none;
        d=google.com; s=arc-20240605;
        b=TT7Gkj9B7WMgx+O50Ip95e1C2dT55fPdNrJbfGO5irif17rh3nBNAfibpHTXcljAou
         oJYZvGTRjGK9L0OujKsrPV8fC2hlTQVtK/8bcPweNH6REeGwWlsGApPXA34TBj2OH247
         AI3gxh4R6fVCeutzdMGOShcnADl9gg/FaYlwxo1LG7qNW9Hs28Ys3YmDmQnhudUG8E+U
         2Nuvkq/UrRAgJvWT+NE2YHX/7HWM0xRJ2e/1WAYh7vbJffs2Ezk2pGIc6hP8Gcp+YcW+
         Ga58eGzsm8eWC570+5NrMVd5I5AOa17ZtNZXnm3R3hOs0aNbOhEtmba2c35Cr9rSYfC5
         jDyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CnD4wGwZvJQvR/a6rbd+FFqGbZMJuBdhvv8TVCrH3ik=;
        fh=iTmHfC+qmxev3of9GA6WmVM2tTAH01CP9kNa7DS3buI=;
        b=bOaWEaDt6erXKcQakTHUEQ6ARsnCz4Xg8gujoWUq3AkinLSZXvdZe2T1DrYCmAT7N/
         oF44r1BlwmGFA+WCvEVGPOiaDSrDEcWcvEEASyR7luMND0qAUNIa+JPM+5g7YknbbzX9
         2h51qDZlTwi7w4j88oa+2RJnhPtsakXNyFnfYdOrs2DmNrBF2VizD+90O1jUIL3aQ0kD
         hm1XsPx9W0a/CZYfaqA54zxvegesURPRBGJ056OSADMYAHJ8E5Dw8qFiRp/nJp1cxtx0
         I9VdC6SBqeRQw1FRGxsKEOxwEtLSAIEy0hhUe/jFk7zAnbochx1AslvQ8OFk+IdKQypg
         j1Dg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774557838; x=1775162638; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CnD4wGwZvJQvR/a6rbd+FFqGbZMJuBdhvv8TVCrH3ik=;
        b=piX9Xtl3iaNv8uRfxNguwwZybMuQycDIDPJDH0KJMJLN8uO4MO9qljp+6Um2fxBy0W
         DvbbxR72etHfe2JSvVkW43pq0jujJGTwdK6ZIn9fYJxI0JEyQIpzWNhFE+UPxqAXCFOx
         muZ4ven/Q02Rnfe0TNN5n2BfIDJfc0qu7dlulBOX+4IMwpRmLZHE4SKf/IolDO2ZGwry
         SzjXwCdA4gxJYubVTk+stqy1YCCmBeW+ZAgNmOUYeO3y2mXlphgmGYGEPOoUqpKw5HpR
         Ie5nuyrjnlTAW7NHJdpmZrOjV/IfjDvFPmsknTUTQ/VJT8MbysYMuKN1aoCVotxvyED7
         uSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774557838; x=1775162638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CnD4wGwZvJQvR/a6rbd+FFqGbZMJuBdhvv8TVCrH3ik=;
        b=heKZZhHPg0OBUAn4XZaBwcHBYwrW2U5lXYBBXr3/wtDqIPoeOacIHer0tofyUnwegJ
         BQGKvl07l7eI3KRGwUq2gLdMdCE3f7myH7ghkwRnSAfGNhb7Qe7DlKQTaYZQrO2jnfhX
         xTGwxK3axAkw0KfltlRlbDh6fcTPw65+yCLipugZLl+zhUaKBLPIvJ3DtTJ8UIlnIYYe
         jT2M8O23tqpQSEEUKm9pp0d5fyMiXFNqiuITjlqZi+MrDm973nhhwWr6XFt6/FG2ZKAN
         ww79oBREMp2zsAg8KRrJ9ZtBhOgR7dsRrnoApzKbqtXqV6RktwmW4WwlfFNbqUkLaQ/X
         sSAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUeT0UTlBN/1p+4u+ycG7xerLfXIfJ2TpViC6oxrM7OS+d5I3DeFo6mXehYvXScixzIKUMooBcKE0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZTgYPp64rLcLcioFW4A8ctul4TobBUKR2mHqXxzoEefmWVrGn
	lNHoxoDjdPJBchnDfr5lr0jZvAaGHQjgrKXNhxkfPX0pTUWCqI33vbcdytQM+las8ylviltVvFJ
	ypNYjWOj4YQ8C2h/KFIcDSkHIW79Qn8ua//lAhaLQ
X-Gm-Gg: ATEYQzw8ccm04E8zGbCgPw2DbuoNujT4TXR0o1TV+Nc5k5LCCWfVqXrkuQ7UwhB4Ny5
	LGqeBDrGgx82jLStKtkIAu0JyTvIaIRYU9jBr48XwXMQmJQn08CYEaONJ0fTktBoQdGWJh+esOM
	MwfD120RzNKCRRWDDiGFQS41YLJR1aFnUx00BwL8qtsnbF1rM6sexLoQjeOOozwV/FF2oTWcO8O
	iDaZ0F3KGmE1xNjKoGWg6dW5MO04n7umOe4DUeH4RFEsLbtzDHgoq/Xsbv6juJWF4MqOhd6Imk2
	rmzc92lH
X-Received: by 2002:a05:6512:10c6:b0:5a2:a5e0:2da2 with SMTP id
 2adb3069b0e04-5a2a5e02ec7mr1094413e87.8.1774557837156; Thu, 26 Mar 2026
 13:43:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323235817.1960573-1-dmatlack@google.com>
In-Reply-To: <20260323235817.1960573-1-dmatlack@google.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 26 Mar 2026 13:43:29 -0700
X-Gm-Features: AQROBzDv95n65Jfr7km6DKOoUBuRrbrSOHrGu-gele9pXf1C5O1laHd_UCbivjU
Message-ID: <CALzav=f4--Kp5vXz5zrxZR3WVsa9T1GF4NFFtuf_Q5ESMHmWwQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/24] vfio/pci: Base Live Update support for VFIO
 device files
To: Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Mastro <amastro@fb.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Ankit Agrawal <ankita@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Askar Safin <safinaskar@gmail.com>, 
	"Borislav Petkov (AMD)" <bp@alien8.de>, Chris Li <chrisl@kernel.org>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	David Rientjes <rientjes@google.com>, Feng Tang <feng.tang@linux.alibaba.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Kees Cook <kees@kernel.org>, Kevin Tian <kevin.tian@intel.com>, kexec@lists.infradead.org, 
	kvm@vger.kernel.org, Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, Li RongQing <lirongqing@baidu.com>, 
	Lukas Wunner <lukas@wunner.de>, Marco Elver <elver@google.com>, 
	=?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, 
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Raghavendra Rao Ananta <rananta@google.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 4:58=E2=80=AFPM David Matlack <dmatlack@google.com>=
 wrote:
>
> This series can be found on GitHub:
>
>   https://github.com/dmatlack/linux/tree/liveupdate/vfio/cdev/v3
>
> This series adds the base support to preserve a VFIO device file across
> a Live Update. "Base support" means that this allows userspace to
> safely preserve a VFIO device file with LIVEUPDATE_SESSION_PRESERVE_FD
> and retrieve it with  LIVEUPDATE_SESSION_RETRIEVE_FD, but the device
> itself is not preserved in a fully running state across Live Update.

Apologies for the large number of people who got added to the CC list
on this version of the patchset. The changes to
Documentation/admin-guide/kernel-parameters.txt in patch 4 caused
scripts/get_maintainer.pl to CC a number of additional people due to
--git-fallback. I'll fix that in the next version.
