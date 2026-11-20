Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795166365;
	b=CfZoHCCPssjL8iEhBmECfnuzg24iM3ZpppwIHzlepxlgAEfHgEWeNzqVIpzjJ5VDY6gM
	 7PKVpOYyIgTyqmZ3I+kbWj8/7sDvj2Mtf4SaaIzrwCjQEFwMTzZ6fkIms1A2LXZny16Lu
	 evZdht4/I4srgQ7BdXQPgUUhn2IoSm39ZwXnPUgzhHo4ibdAy4obr6KN90weBaHHhjUGf
	 kx6GN27u12rJxLe4LRwbaTkjamBb6Kn3zbo76MMMSUfk/iFKnlWnFhdYYN1NpVGKwMgJ/
	 VTHQhHbv7292qcz1xmIA81bJ0ulHzR2b8BM9mAir3tJ+chqqeqLXkGszmVOmrn2LCAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166365;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=NXbyh/zLUD7PEdLtCVAgHutA0kCgtrDRw7/iSzMTz60=;
	b=kVMBahXhuvV8e9GY4H2Mppy8J+X9RPzadec8EjSJ/8oJ2QMchADBXWCClLROhbelZEhh
	 iSfv8u8otnmu7UTKW2Uwafx+zBawr8HO4oLnzkIQ0oao5waHy+fH2QLgp6MtR9Fo/LASx
	 sRojSCEr/eEBJauz8JJ4gyBE1CrNSG1VB3mkuOV7yNwC3fQ+CRK4vKNTbuf30wmJn2bCS
	 1/OahbJig3TAEZkR3Y76vBrzm+88eKk13bGy3/QfAYiyiXeWp3HRCOEroI3wawvRUOz0F
	 v5F6NhHAgVYp08aoX09d88K9q71nshVl6hn0pyz2S+HlViIPIV41QlgBa5C4jPuV+XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BQX8lsgV;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58701606A320
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 09:19:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58701606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BQX8lsgV
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso3469155e9.0
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 01:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795166364; x=1795771164; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NXbyh/zLUD7PEdLtCVAgHutA0kCgtrDRw7/iSzMTz60=;
        b=BQX8lsgVjhQnLkh+BMUGM3sxWDYtP1zf9pxEgAiKkKpGjof4Mu/tS9qG8StyXGVq3q
         m7RwNdCBVPgRtokqJv8SAr/c64mo52W/LqtSKje4ENc37an/GgQnK0OX1OC5Ju+vUqeE
         hGENJtZiAdx2m5HXZTmVvyx3eQT+bgBs1Kqd1oLebkRW+d+jhgmcU6Rt6sBQOzY4F/he
         uy28mpaWhgzFS7YlMlXqX2bR6u1pSXMHOG11JkqeeaGr3pd2lK7lzyq4/C36KmtBH6jr
         PRD64DqzjyVDyfX+v7Q48box2mYP7Q768ngB8CZC2h9QH9nMtygWhKq7PqKgrysJmda/
         bzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795166364; x=1795771164;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NXbyh/zLUD7PEdLtCVAgHutA0kCgtrDRw7/iSzMTz60=;
        b=S/oa0F54ctI034izJxJPHBjO4x+LJAs8ee8sxjAW8MCJEs22KGLp0Q80OG+huWN5eV
         KAKc6tvqYss4J5Plsakognske4g4seKLPK/1/z6D5NYf6KHscD/7PGb/1w++ob5nDIi6
         mkzklA4T4yN6h/IpcxxZj9lZxvYbaBGR+sN1kVLnOQxqJwLKX70nN7jO9T5pvKPscL/w
         fSpSq+XVHOwwyAQI1T/n+k+Jxgp2SeG72i/ZnSCdh3PXsrZUdveRdMi1gKZqnpl6S+Mt
         J+QTyTB65bSf2a53Z8v68Og0gJi9rV419ZEBtzXUXgZGgoiHSOc1A+cD/rbQ4YmFMqxs
         YEkw==
X-Forwarded-Encrypted: i=1; AL+hErHNZygTct+amJuJs5Z2GLtGHOLADGA3t+hub/oOZak0GUY77YfP/XxGEsTvh15NffjLjNzySpkgu9M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YaJ/NmVTJpb/6EtfIkOwezCMDypLmSAsME69F6WRrN7u7KWMY
	s1MbRHZLQ/M4bXpcouA1yocEqoqsv/jjTg3E8PhPFBlYNfDoe6AwLeKkUW3cIiGCJPg=
X-Gm-Gg: AYBFou1h0TpCfO6qpxsdsWAqcFsU7Px3/pMNAo8dRX7XnxPbPX4GvAAmwwKR9NPU576
	6TSNgZlDq8UqZ7KgmriVc6hjoNniT5QmeOgv8dsGMqg+pAxMWY4hknQG5RbnMMUPyxQGMVrqLcO
	fx3/W6H1DRWsDpe9KXSY4fMurc4CZUexA5Jscy62SRlB2HXdjgXipBMWFLlA+bBYvv2yJH2neKQ
	71p9mUtGdT8wfLfdFOfWXOXBN3yZdwMnF5jwDWwJwVF1eZ7nQjofzaCPwlK+0bZ5zr1yhSOTQQi
	GK76yc/wYpgCFlCbzdC3xDp1fYU08SffljSzDnGJJG5jEQknAxaNEYqFyS90HwK1bnDSMzA7csa
	lCkjmgfhSCm4a9DkjhhSobpa/6XXIke1/Rl1bhYUj4Z7s9azTohvTH6AQIs5mAPj3Dmi8SSl2hv
	yUa4m4x1zeXFMxj6Vaxe0838GFkozoEhF48wWyENqj6opqkI6NvdZ5a974ccDN/2emjuiOeD2M+
	67exyhizvfdeMsxS1vxG3YvvTXI/vvDrkgAuq+EPAZUe9ywwU0XB2vBwXtAudZpKdgOzU4M3pIk
	qlT85fmZKlv6jCaoBWqq
X-Received: by 2002:a05:600c:530e:b0:4b2:2ec5:8a2b with SMTP id 5b1f17b1804b1-4bb887fe8f1mr53972495e9.10.1795166363741;
        Fri, 20 Nov 2026 01:19:23 -0800 (PST)
Received: from pathway ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f643adsm27023055e9.1.2026.11.20.01.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:19:23 -0800 (PST)
Date: Fri, 20 Nov 2026 10:19:20 +0100
From: Petr Mladek <pmladek@suse.com>
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Dave Young <ruirui.yang@linux.dev>, Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>, x86@kernel.org,
	Joel Granados <joel.granados@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Bo Gan <bo.gan@broadcom.com>,
	Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>,
	kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	Michael Kelley <mhklinux@outlook.com>,
	Ian Forbes <ian.forbes@broadcom.com>,
	Bradley Morgan <brads@mainlining.org>
Subject: Re: [PATCH v4 3/4] x86/vmware: Add the vmware_record_panic_msg sysctl
Message-ID: <awAQmI2wu0rI-efH@pathway>
References: <cover.1794980455.git.zack.rusin@broadcom.com>
 <4c5de34b10f579368b890eaa9333a2755886bad3.1794980455.git.zack.rusin@broadcom.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c5de34b10f579368b890eaa9333a2755886bad3.1794980455.git.zack.rusin@broadcom.com>

On Wed 2026-11-18 01:01:50, Zack Rusin wrote:
> Allow administrators to disable host log transfer on ordinary guests or
> opt in on encrypted guests. Expose the boolean recording policy through
> kernel.vmware_record_panic_msg using proc_dobool(), as Joel suggested.
> Zero disables recording, nonzero integers enable it, and reads return
> 0 or 1.
> 
> Register the sysctl only after the logger is ready. A registration failure
> leaves the internal default in force. Document that the log is sent
> before kdump, and that disable_panic_notifiers_platform_list also skips
> it.
> 
> Link: https://lore.kernel.org/r/4e73yd2ofpdzl6rptzvd74no3hnyfblknoq7wzxlw7f3zjbz7c@srfabx6lsusj
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>

LGTM:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
