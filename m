Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872289;
	b=tbvHiUMOFCzxUt7YmNDlaOGOcujqler3RsOQyvQxhXcc33a57s7RfGdRsee7mBZ948rS
	 tlhtDNKMq60xbGtps/YHX2ZDTShSva6Fz52ZNy872bt4N53q6JATD2ELLzidNT8wNWbrK
	 gwKAzc37pdPJNBpRWyp3HBZBCILaxVh12BLzCh+0TeBkNv5DkT30smI9+VwCYvgT8bw5H
	 UMgfLmYzE7NFsh7JKf0sHayLS9exS7ziqmVgRusxAJe6qAJUF0gYOWN22jUltFpkHmuDC
	 lmn/xSID9GPTCJz3wzQGN5cuAfT8CelloSBKZ8ByZGWvJr2mQRs5faqv2hUBMcoqn6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872289;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=SqrTjgENN7Dfs+HehxbKPgACeb32UvvfMAFijNHd6N4=;
	b=pV3d708qvIztgF5N7ccYjAA33b44cWR4k+5MQqAVmwQi/7fABj7GRT++kKB8SWbHI5Co
	 VExrmQjoQwbP+IaDxH50c3WtSCUs3ggSdKUjgtmK+7aYPEbALcPO5aWPulqtbWnO7T+sx
	 eNmVZdXpyQ0UBfNGROC2DdJtYICjCVgnU+bxI6L4txMYM/jI4o4gpDAcX/LbxO7FWpKTf
	 6+tjz0p7nZEEYnPWd3lRfEWJF6fkoj0JZ8bz7vc2GBPKi4yCWE+MeTvm6GxUTWZf3+jGk
	 uaSo0HO8xOIu9mCo59mtaBNkGAou2RlO99kb3izTOwkOu9y72+vX+Q4bwKJ5w0ayh+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F146083606
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 09:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5F146083606
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91c7a0c1617so23258886d6.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 01:51:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872288; x=1794477088;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SqrTjgENN7Dfs+HehxbKPgACeb32UvvfMAFijNHd6N4=;
        b=qrxtD/HpY/0NJqDr02O5f3zaDoEaH6WWQQAc5xZU9ktXFMnX/2twIYzhQMFnEjHb7O
         eSMT9zywpNrVz9nvJB5QztPQ1LmFaB/c4KO9vkrx+ZVHkLole2/FgOkXEbIdeUgN9JgY
         Zx1hOdRKv16yWi1saYrih+2fIauMjiC9XvfyJ6aPUfhQE/6i4C57n/ITgVXIDhgxaBdo
         XQddYPB8oi02UNjrepn6Oiv4X2X98xteLDDkDl9EKrDRaHXy8phGiprz6lpXt7jEIBHE
         eebpt/LkBfuVSmwP3X200hR1gEU8oV0LNQkhCa8cbKW15C5pyGjPVlyCY1EmMN0Z1FAh
         orDA==
X-Forwarded-Encrypted: i=1; AKwUvByp2KsrgLTvgkOvJ0G7R7lQSBid0DhBXeZJLK6ZSs7LLMpk/8vItMLCoQeIlpSoPVp969/7gW7F8Lw=@vger.kernel.org
X-Gm-Message-State: APuU4Z92S+lOUnus8fAUAjQg5MPuoEF1j5lqqe4rTXSBabE9xz6b8HLD
	sCIrgCgEVlubipoUXxvnPQ+0JjR+jcOreBFtESNCocFgOdWN2m6qJOsLXQ351SJWLnQ=
X-Gm-Gg: AYBFou0JgPMaO6UwEK7p+TooxAaurkSCGpt4YMqo9cbw5LJ3Gf677BTDyJsr9JNTfRc
	vW8i4V0c9z8Cm+4umObHnWQpzyN50FrJ03MAalkhbWhNzTW3aFW5DWm1NOdmijg4Nm0eaYIwAk3
	6PMgjyHgvqALyMRSowwdHUVybctLRpoH2qlN+8GIHxd98dNbrKkoh7379vdi4aj8hDJuMAXJRcz
	IBd81uiPxb1uLdruKO3Bw6O6yh8s+WXb3In6dTJRqJQwclm9ayhmLGrazhGZDa7B/KFnv7LjIZQ
	mov0L5F8zB+bhToFFJsVMVCFXb8W2c6Ja8xbBk0hZAQ/XMAajaqNsgchaeD3hoIhBuRUWrQ6FRP
	4I8DY3hs+EfpWd9ZQllIL1PLeH6pdW6AZGSN+L2VuS0w/O6V1RdoAzDdicvmNK2Tc+950vQuuAo
	uy5PP7O2U5S2hmouxQ6rOrsqOGy7OS0yoAkDp2xHuS8finGiMtHR99QAzKtwEZrrEWUqJtv7/Xb
	mo5zVMXL9hDIq30NgnJz4fcJhSuOV3thkhmX8+QG3+nyCNs7JBN035TttFwA2vsZ7TsdrFjIVDA
	l1TvnDIUSgY7ksE+crclI0awU4N1IPcthOJx/CqMrCwMUUDAfGTnumTEyq22Nl2U9nN0MH7wCDP
	ufjE9Rz5Je38x9UA=
X-Received: by 2002:a05:620a:8005:b0:93f:611d:a18e with SMTP id af79cd13be357-944216ed622mr3232572185a.55.1793872287568;
        Thu, 05 Nov 2026 01:51:27 -0800 (PST)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com. [209.85.222.181])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d468f904sm419988485a.5.2026.11.05.01.51.27
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:51:27 -0800 (PST)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93e635220b4so159020185a.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 01:51:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByiV5uyXJybKzZWfO2560yz7gVd16iNBgT73oXVHuPEkTR9vNxMAjPSiuA2ruAhrUYrInv6mHs9RZ8=@vger.kernel.org
X-Received: by 2002:a05:6102:3ec5:b0:7cc:2bb7:131d with SMTP id
 ada2fe7eead31-7d072baa484mr7324212137.9.1793871885062; Thu, 05 Nov 2026
 01:44:45 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org> <20261104-work-procfs-bugfixes-v2-10-021c84d852e0@kernel.org>
In-Reply-To: <20261104-work-procfs-bugfixes-v2-10-021c84d852e0@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:44:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUy1RYKG0g8OWss3AD-jyYx3DXL0K7ABYkFUdxTxZ9VdQ@mail.gmail.com>
X-Gm-Features: AclHuK9D-nB8icBns0zdoQH8fV1cfUPJ6LOey8o_VlUZpDIGqKC4cFf8-j5-HdE
Message-ID: <CAMuHMdUy1RYKG0g8OWss3AD-jyYx3DXL0K7ABYkFUdxTxZ9VdQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 10/51] zorro: size the proc files like what they serve
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Jann Horn <jannh@google.com>, 
	Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Eric Dumazet <edumazet@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Jonathan Corbet <corbet@lwn.net>, Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@suse.de>, 
	Joel Granados <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>, Jan Kara <jack@suse.cz>, 
	Jan Kara <jack@suse.com>, linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org, ntfs3@lists.linux.dev, 
	platform-driver-x86@vger.kernel.org, coreteam@netfilter.org, 
	kexec@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-sound@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net, 
	jfs-discussion@lists.sourceforge.net, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-mm@kvack.org, 
	linux-sh@vger.kernel.org, linux-usb@vger.kernel.org, 
	samba-technical@lists.samba.org, sparclinux@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-doc@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net, 
	Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org, linux-raid@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-debuggers@vger.kernel.org, Chuck Lever <cel@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Nov 2026 at 20:18, Christian Brauner <brauner@kernel.org> wrote:
> The files under /proc/bus/zorro hand out a struct ConfigDev and seek
> within that, but their size says sizeof(struct zorro_dev). Say
> sizeof(struct ConfigDev).
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
