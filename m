Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF863A8388
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 14:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778594838; cv=none; b=iQYSPfYujhOLfP5CFKxPAn5w2t4kYMoTBBaYxMm8k0TWrq2HUnJMxH9H6rqxRCesaDJx0kKkSXB+tdAuj464iZEQdT2v0A1Cj7mX1odauEm44vR5XPxdNf1k3cFK8zLQdGTGf8qpBqmKzm9MTlP46WiHg1W98wnJKcQWlxx7v1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778594838; c=relaxed/simple;
	bh=bgBCtNkJnsiY/BqSw+6iZ38DMKEEFC29v57mwpmfH+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8Gxt09LS8neQPTgTOLijfTW7GPGwKDdkb+1ZoLbUftrxIEgTOxiDj1cFzZczcvjjeEtU9/+Bsxr+v5DMYjvZS458Ru++XpAGYEtVGbpAkHdV772rrzRcKGAyIajqr1srIlITYNkOMpsiQaOiYqRoZ1c9H/3TALm0sZ+RmTjFkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=a1AKBlkb; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="a1AKBlkb"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so94741905e9.2
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 07:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1778594834; x=1779199634; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vEuT8mU5zwj23z5tjg7/0cCroKq2YLlwPoM85Ob95Js=;
        b=a1AKBlkb+zbjKzr07CAkgRAWlSxhhCfxvhMVUJtl54NRRR3SzBFMSHkFXqxZ0CvFH0
         iykelWeVpz5jqx2sWOMkX1zpUKUqmUlJumpneggyJocP76N5ObtIS9wLFaMZLQnSKl8k
         zJmnek8cMvX7V0a3vUCT5uJvmpMYaN59HhNaRy7kNyoV0MPtM7nUss9WAw10rjZrmLRE
         3r0PYgcK320mAkTBC9fQHgzs+zijdiSji4Zus1qJNscR2/NJKgnQEEkQ29WeXLoVUpeC
         ufbYJLvUIrXy+hXWSW8pOTc3Ss5xLcJLKC3A+e6iw3AMoIesVhAWwOgTbTmE/vMR97gq
         anSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778594834; x=1779199634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vEuT8mU5zwj23z5tjg7/0cCroKq2YLlwPoM85Ob95Js=;
        b=digJNeOMoi08ab1zrm1Q+rkBCCNl3rfVE/iD6X/cEJLpsIPs7M7yWNdS3TRXK3tA8/
         fUBMKfLXK0AP1TEkE0fYOIkokWOLP2Fb2QTVTeN7miGrAW8V7MZiqMVM5SmGDYv52psI
         ehx8V2Bw08IMMjABBikPdN5SZUpFUAy0V9htn6qiarmFtWqqGQby3cZ1dGQEviODMyX3
         I8U7cWNvEkuAO9mGDq26tbWiOtOqLySlsZzsJCgrcWqul6iRrBxccywYdnIxzjXzbq2a
         ehrfQNQIf6AouA6JU6CI1Qx5O3qaANh4bw7ENMBe9WHjMnOEbzzJsB1XlsLjHf0K4pBh
         o9Uw==
X-Forwarded-Encrypted: i=1; AFNElJ+znCE0832jsm3z0Al2uwNV0wh33NDRYu/XehoGhK4FKpJJsslUdtsC2ocmwe5UH4YaRdus7t9bhpA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjounhEcKpMW5QZHnHQZGx5UR6655i+QLjYLx1d/WqWf2sdNEq
	CKUGAqfYMdklYk7XfBq9V/d8Jk71e7pE89o2nqMdYRMcPgIb3q7O3pWn23jUjBA2whc=
X-Gm-Gg: Acq92OGK62EpWuNqveiAEnEJH/O5Yrt5HCj9r9t5mtbzAVquLTpLE21dgeUhw3Lh20T
	LLOmaSa9MlRdgFrVxiUi2heQ3gNLpCXNpE3g/YfVULsY7YJlBu9syRVjmGNCEINamQsLj99InCN
	rjHs/rvyTYeandYABCjyWvjzMG5bgf1fSrqnay0SQYectU3tnj/KZw51l4POLyIXyhN/UcyRktG
	/Lwa34aVmeDcPwhbUvnwjOOylZ4TbOEExyEpW5fM0SZt0W8ayZ1c60RDLpMhgImC4pNtCO/OOmp
	IQaU0UImybF+Ml/7Eox2Kkh7+C5wuXJMoqzh3hGtYpY/InWGJDObaO0bp0qPKozZZf/QFV8gskZ
	v0c92dLX2YNUMOr91h0cRE989FPz+WaOYy9qHCNZ4Kfou9AMWeKy+xlVeYqKVNcTkLR0VR6vIMx
	dd/D9eEHADs3IuiBgj92rhsMaKajKCK+rRdfk=
X-Received: by 2002:a05:600c:8115:b0:48a:9540:1a3a with SMTP id 5b1f17b1804b1-48e51e196f9mr466793535e9.8.1778594834461;
        Tue, 12 May 2026 07:07:14 -0700 (PDT)
Received: from FV6GYCPJ69 ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d19854sm520285e9.1.2026.05.12.07.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 07:07:13 -0700 (PDT)
Date: Tue, 12 May 2026 16:07:10 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Parav Pandit <parav@nvidia.com>
Cc: Mark Bloch <mbloch@nvidia.com>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Simon Horman <horms@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	Randy Dunlap <rdunlap@infradead.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Christian Brauner <brauner@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Kees Cook <kees@kernel.org>,
	Marco Elver <elver@google.com>, Eric Biggers <ebiggers@kernel.org>,
	"NBU-Contact-Li Rongqing (EXTERNAL)" <lirongqing@baidu.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Subject: Re: [RFC net-next 0/4] devlink: Add boot-time defaults
Message-ID: <agM0DsiaAH8-Ox7N@FV6GYCPJ69>
References: <3f9215c4-7c84-46d9-ba74-30dabe24db09@nvidia.com>
 <afxvzOjqw-vxUAED@FV6GYCPJ69>
 <b6a9b568-dd09-4414-be57-6b9cd282a43c@nvidia.com>
 <af4lBIJdCuN5VKq_@FV6GYCPJ69>
 <20260508175213.1952097f@kernel.org>
 <af7Y4AYv-XDCbK_8@FV6GYCPJ69>
 <580a774b-ba9e-4523-b43a-476f75dd5b12@nvidia.com>
 <SJ0PR12MB68068C50EE9776A3D9060635DC382@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <agLoeZtsSizR-R24@FV6GYCPJ69>
 <SJ0PR12MB68061C61AA2BF5D81005984FDC392@SJ0PR12MB6806.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ0PR12MB68061C61AA2BF5D81005984FDC392@SJ0PR12MB6806.namprd12.prod.outlook.com>

Tue, May 12, 2026 at 03:48:32PM CEST, parav@nvidia.com wrote:
>
>> From: Jiri Pirko <jiri@resnulli.us>
>> Sent: 12 May 2026 02:16 PM
>> 
>> Mon, May 11, 2026 at 08:21:37PM +0200, parav@nvidia.com wrote:
>> >
>> >> From: Mark Bloch <mbloch@nvidia.com>
>> >> Sent: 10 May 2026 06:02 PM
>> >>
>> >
>> >[..]
>> >
>> >> > I look at it from the perspective that from some CX generation,
>> >> > switchdev mode should be default. So that is a device-based decision.
>> >> > I believe as such it can optionally be permanenty configured (nv config)
>> >> > on older device. Why not?
>> >>
>> >Because sometimes switchdev_inactive is needed and sometimes not.
>> >Such knob is not device decision.
>> 
>> That is what I would call corner case. In that, user can use userspace
>> configuration to change the mode in runtime.
>> 
>Corner vs common depends on users one talks to. :)
>If fw has switchdev(active) as default, and then 
>And user needs to run switchdev_inactive, it will actually break their switching applications.

Can you describe the actutal breakage please?

>
>So, one needs to invent switchdev_inactive in the FW.
>
>Jakub's suggestion in this RFC is covering both the scenarios uniformly without above problems.
>Single uapi for all the cases, so looks good to me.
>
>Moreover, do not understand how alternative solves such problems.
>i.e. user is unable to configure the fw because driver is not yet loaded/up.

See my other reply in this thread. I don't think there is a need to
configure anything in FW. If we fix the behaviour in switchdev mode for
non-sriov user and change the default, no fw knob needed. What am I
missing?


>
>> 
>> >If it is placed in the device, orchestration needs to yet use additional vendor tool to configure in the device.
>> >And that theoretical tool cannot even run yet because driver is not yet loaded.
>> >
>> >That sort of defeats the purpose.
>> >
>> >> This is a deployment policy decision, not a permanent property of the card.
>> >+1
>> >
>> >> The same adapter can be used in a regular host/RDMA setup or in a
>> >> switchdev/offload setup. If we store this in NVM, that Linux switchdev policy
>> >> follows the device across hosts, kernels and use cases, and can surprise the
>> >> next deployment that just expects a normal NIC.
>> >>
>> >> I'll send another RFC v2 with support limited to:
>> >> devlink=[...]:esw:mode:{ switchdev | switchdev_inactive | legacy }
>> >> and let's see where we land with that.
>> >>
>> >This looks elegant to me as well covering all eswitch modes and still sw is in control.
