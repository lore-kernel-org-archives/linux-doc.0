Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9D23C7D043
	for <lwn-linux-doc@archive.lwn.net>; Tue,  5 Jun 2018 19:46:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751923AbeFETqk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 5 Jun 2018 15:46:40 -0400
Received: from mail-qt0-f196.google.com ([209.85.216.196]:36076 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751864AbeFETqj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Jun 2018 15:46:39 -0400
Received: by mail-qt0-f196.google.com with SMTP id o9-v6so3798112qtp.3;
        Tue, 05 Jun 2018 12:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yeJQDfsde4omYsCy57+lVVZqh3xZFGBifVBGB/1tPo4=;
        b=dvwLSuCdpCkRSKPwZ9qrYiRNAcAwUeztcS4UBtvRc9vXH8w+zR+8WOg9ov/jNxJc5i
         5heB+j+urgGX+xxvbom+WWoiNgdOPH/HszEklVnlS0f3rDXKu7Ow7WXccmuXptDnB+bd
         B6RJzCzW9OMCVfN9dzSiyEpM3z1FYBs+P8ldx5Xik8OtSEWlx0977fNQjo/rw1lexECO
         r8X1xvJ2SCr7NxzSS6apDjv8ThGSI1QuAzF2J7YB0HEknesZvSPOkkYvsWN6bkj/jQW1
         TZI+Kv+5SaBIIkrVdi8oohcrLEB8OOw8C1y/h0MyQs2bkduZUve/tb4CXDekxR6v32w+
         bhfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yeJQDfsde4omYsCy57+lVVZqh3xZFGBifVBGB/1tPo4=;
        b=uAV+hbJ9KmKlMwxazz+0fbUYUw1nV3qvlNudZHU4FDhJFkN/GaZf9HO24QUKAaN8gh
         pV//H0ygR+/hLOnemPse6q71ViRs6Ih15BTHEaJBsTMusWEtHECA5G5lMGj8T54FsGaJ
         9ske992pcIH4FjIvPOx4myBKJ4ab8SNpu99WmHp0eGyOKPrgliLhmIZcaKWPmUmt7YxQ
         bW49J2fui785Buiq+Mgp2d7H8vEoxzqPk5paLrHKjHoECEqgxZTukHrF/iB5mkGZxwEJ
         AEeOfZN8x42dsTyKmlwsTLu4ZBGZA6XNgiyk248HooQ0tCTbyFrz5QH9MEcBJ7W4f++A
         CaUg==
X-Gm-Message-State: APt69E1wzhH1IsKehTASwO6Jub+gFMX6IZ156I5dY/VpfEw5iZGkmRRz
        uKs5WQnYHuKLigvF4bJd+ic=
X-Google-Smtp-Source: ADUXVKJOvkGSTwgjdXT4EtvuTGe/p5czJsj1ci1RroONuuaANXSH2xrNWoqP0OIvx8Av/1KTVLttnw==
X-Received: by 2002:ac8:3854:: with SMTP id r20-v6mr32441qtb.190.1528227998164;
        Tue, 05 Jun 2018 12:46:38 -0700 (PDT)
Received: from [192.168.1.237] (pool-72-66-26-176.washdc.fios.verizon.net. [72.66.26.176])
        by smtp.googlemail.com with ESMTPSA id k44-v6sm20259060qtf.74.2018.06.05.12.46.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Jun 2018 12:46:37 -0700 (PDT)
Subject: Re: [PATCH RESEND] Documentation: filesystems: update filesystem
 locking documentation
To:     Al Viro <viro@ZenIV.linux.org.uk>
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org,
        Matthew Wilcox <willy@infradead.org>,
        Jeff Layton <jlayton@redhat.com>
References: <e4262947-a2c3-c932-caef-67d96fa59cb1@gmail.com>
 <20180526034116.GO30522@ZenIV.linux.org.uk>
From:   Sean Anderson <seanga2@gmail.com>
Message-ID: <86caf9d3-a520-bb4c-b174-954966c844e4@gmail.com>
Date:   Tue, 5 Jun 2018 15:46:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180526034116.GO30522@ZenIV.linux.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

> Your mission, should you choose to accept it, shall be to locate
> the old sig regarding the usual reaction to use of
> Quoted-Printable...
>=20
> IOW, fix your mail setup.  Applied, but.

Not sure what you mean by "Quoted-Printable"... Is PGP/MIME the
incorrect way to send messages? I've switched to the "traditional"
option for this one, and I've enabled "mail.strictly_mime" in my
settings. Let me know if this fixes things for you.
-----BEGIN PGP SIGNATURE-----

iQGTBAEBCgB9FiEEkGEdW86NSNID6GAoPuiP7LShEG4FAlsW6JxfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldDkw
NjExRDVCQ0U4RDQ4RDIwM0U4NjAyODNFRTg4RkVDQjRBMTEwNkUACgkQPuiP7LSh
EG6W6wf+MS92RRCzMWTlvdUQZhIdMMzLBwlU3D4Y6eiEWzRz1o7IJxmW+0hmUCws
xo2uC1iUifRSrulYMHOmB5kCRIjL5grpadiJRlJzO1/EKkV4MUA4LlVqh9Z2sXae
o8bxC42/NF+7XKrABBuB+xzi51XGYXG4TevoB/FIMzQIHtnQ0EOkQomAxClm31gx
HbV/GKraYYseINuQ3m1hOdKD+Ior4laySpqbPZLx+8wumIzArlcsXJiw3BpF194W
Blmt5mDNybRPNObEk6huRXsbxoFq95Cu1w8UzFCp2fI6XOZlS9Z+ZrpKixpzFJ2p
lkEPDgrxEeWIA2nxuIsFGwzPnibrpA=3D=3D
=3D4mdc
-----END PGP SIGNATURE-----

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
