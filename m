Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID,T_TVD_MIME_EPI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 66E757D048
	for <lwn-linux-doc@archive.lwn.net>; Thu, 24 May 2018 02:29:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S935260AbeEXC3V (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 23 May 2018 22:29:21 -0400
Received: from mail-qk0-f194.google.com ([209.85.220.194]:43068 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935126AbeEXC3U (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 May 2018 22:29:20 -0400
Received: by mail-qk0-f194.google.com with SMTP id h19-v6so78545qkj.10;
        Wed, 23 May 2018 19:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version;
        bh=9vRR56N8vgfK9QvoXhJfLvDcAEwDZc3t5k+4UCOVeo0=;
        b=ctFOUG2XddXTOMcu5pDTwpNwHXk5H9uXClVdhTnE+pLHRCrbfxi6uavYaFbzcmlYiv
         4nH/PXpvg9jWFYeMCTY72j0f+e8grX00lX4HWm+ZW2wwGnWi4RUi9bh4Xx64VHZQMIxE
         bz//BhcqVMs5qtG6l8JnDkPUTT1R5beDD0ZQaa8xsDLMV301fokGk8wnAdKaU+O/NOSm
         ItKvB+9nKzjbJGGWmvvCLtYSnLHWzzr+YIIw42rhkuz/ncQoUJumE5kGxVobbM+7VW6n
         GFtFLqJVqTq8MYanqmhVMWP7N8mc8NEoDCkmMFZJPWZbarbRvGv5sP6pUhFbVxdQbBJQ
         rW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version;
        bh=9vRR56N8vgfK9QvoXhJfLvDcAEwDZc3t5k+4UCOVeo0=;
        b=nitgngg3SNEWyKuME8YkaW/fvlGs4J4dxK+g9EdK9If4A3MN/yFrfbTYwuBJ0tFF3u
         rM9GENISAncCVjlTixvt+dFxffezDBCOuW96fDHWpoHpGRT1JvPrycJMS6pJ7bE/334g
         Cnih8P+njzrH7l349TA/cnGsepeOHmqlB3/J3EJAypG5bpWczXRfO1ajBWL+b3H7f42Q
         ArTrZQNHIkxq65W7JwIgEK/6TlRdv8EsPSXTLDOfEmjK7uEkP2iyQ8Y4yeLZMvkC2MpI
         LBTpuzuZZHy5LVZ5BFNUIeHOLAh/AXDuFvbrnscrvEllGc1CaMrMCjC7SukykpjSXHbD
         Rd7A==
X-Gm-Message-State: ALKqPwfS9TxygpqJlKET7mNY0BWc2sSsB1dTeUKv3jRY7bkb70IF4OxL
        /Q0CVXvjkSqsEdTugKX8oy4=
X-Google-Smtp-Source: ADUXVKILqYYrcHdTbXVbXjV2lHQfjwP1vmyy5U8/IJ3qJW2FcX3BOzskyRwThEf0qEOFmMTRdaTIxw==
X-Received: by 2002:a37:1aca:: with SMTP id l71-v6mr3453882qkh.355.1527128959916;
        Wed, 23 May 2018 19:29:19 -0700 (PDT)
Received: from [192.168.1.237] (pool-72-66-26-176.washdc.fios.verizon.net. [72.66.26.176])
        by smtp.googlemail.com with ESMTPSA id o66-v6sm2188143qki.93.2018.05.23.19.29.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 May 2018 19:29:19 -0700 (PDT)
To:     corbet@lwn.net, linux-doc@vger.kernel.org
Cc:     linux-fsdevel@vger.kernel.org, Al Viro <viro@ZenIV.linux.org.uk>,
        Matthew Wilcox <willy@infradead.org>,
        Jeff Layton <jlayton@redhat.com>
From:   Sean Anderson <seanga2@gmail.com>
Subject: [PATCH RESEND] Documentation: filesystems: update filesystem locking
 documentation
Message-ID: <e4262947-a2c3-c932-caef-67d96fa59cb1@gmail.com>
Date:   Wed, 23 May 2018 22:29:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="aS3VDlDxg6F3C6UjJ1TCTUkST2M7956IT"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--aS3VDlDxg6F3C6UjJ1TCTUkST2M7956IT
Content-Type: multipart/mixed; boundary="C0dUBgQp3Dhd45b44hB7XhVUbCxfDpTXf";
 protected-headers="v1"
From: Sean Anderson <seanga2@gmail.com>
To: corbet@lwn.net, linux-doc@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org, Al Viro <viro@ZenIV.linux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Jeff Layton <jlayton@redhat.com>
Message-ID: <e4262947-a2c3-c932-caef-67d96fa59cb1@gmail.com>
Subject: [PATCH RESEND] Documentation: filesystems: update filesystem locking
 documentation

--C0dUBgQp3Dhd45b44hB7XhVUbCxfDpTXf
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Documentation/filesystems/Locking no longer reflects current locking
semantics. i_mutex is no longer used for locking, and has been superseded=

by i_rwsem. Additionally, ->iterate_shared() was not documented.

Signed-off-by: Sean Anderson <seanga2@gmail.com>
Reviewed-by: Jeff Layton <jlayton@redhat.com>
---
 Documentation/filesystems/Locking | 43 +++++++++++++++++--------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/Documentation/filesystems/Locking b/Documentation/filesystem=
s/Locking
index 75d2d57e2c44..15853d522941 100644
--- a/Documentation/filesystems/Locking
+++ b/Documentation/filesystems/Locking
@@ -69,31 +69,31 @@ prototypes:
=20
 locking rules:
 	all may block
-		i_mutex(inode)
-lookup:		yes
-create:		yes
-link:		yes (both)
-mknod:		yes
-symlink:	yes
-mkdir:		yes
-unlink:		yes (both)
-rmdir:		yes (both)	(see below)
-rename:	yes (all)	(see below)
+		i_rwsem(inode)
+lookup:		shared
+create:		exclusive
+link:		exclusive (both)
+mknod:		exclusive
+symlink:	exclusive
+mkdir:		exclusive
+unlink:		exclusive (both)
+rmdir:		exclusive (both)(see below)
+rename:		exclusive (all)	(see below)
 readlink:	no
 get_link:	no
-setattr:	yes
+setattr:	exclusive
 permission:	no (may not block if called in rcu-walk mode)
 get_acl:	no
 getattr:	no
 listxattr:	no
 fiemap:		no
 update_time:	no
-atomic_open:	yes
+atomic_open:	exclusive
 tmpfile:	no
=20
=20
-	Additionally, ->rmdir(), ->unlink() and ->rename() have ->i_mutex on
-victim.
+	Additionally, ->rmdir(), ->unlink() and ->rename() have ->i_rwsem
+	exclusive on victim.
 	cross-directory ->rename() has (per-superblock) ->s_vfs_rename_sem.
=20
 See Documentation/filesystems/directory-locking for more detailed discus=
sion
@@ -111,10 +111,10 @@ prototypes:
=20
 locking rules:
 	all may block
-		i_mutex(inode)
+		i_rwsem(inode)
 list:		no
 get:		no
-set:		yes
+set:		exclusive
=20
 --------------------------- super_operations ---------------------------=

 prototypes:
@@ -217,14 +217,14 @@ prototypes:
 locking rules:
 	All except set_page_dirty and freepage may block
=20
-			PageLocked(page)	i_mutex
+			PageLocked(page)	i_rwsem
 writepage:		yes, unlocks (see below)
 readpage:		yes, unlocks
 writepages:
 set_page_dirty		no
 readpages:
-write_begin:		locks the page		yes
-write_end:		yes, unlocks		yes
+write_begin:		locks the page		exclusive
+write_end:		yes, unlocks		exclusive
 bmap:
 invalidatepage:		yes
 releasepage:		yes
@@ -439,6 +439,7 @@ prototypes:
 	ssize_t (*read_iter) (struct kiocb *, struct iov_iter *);
 	ssize_t (*write_iter) (struct kiocb *, struct iov_iter *);
 	int (*iterate) (struct file *, struct dir_context *);
+	int (*iterate_shared) (struct file *, struct dir_context *);
 	unsigned int (*poll) (struct file *, struct poll_table_struct *);
 	long (*unlocked_ioctl) (struct file *, unsigned int, unsigned long);
 	long (*compat_ioctl) (struct file *, unsigned int, unsigned long);
@@ -480,6 +481,10 @@ mutex or just to use i_size_read() instead.
 Note: this does not protect the file->f_pos against concurrent modificat=
ions
 since this is something the userspace has to take care about.
=20
+->iterate() is called with i_rwsem exclusive.
+
+->iterate_shared() is called with i_rwsem at least shared.
+
 ->fasync() is responsible for maintaining the FASYNC bit in filp->f_flag=
s.
 Most instances call fasync_helper(), which does that maintenance, so it'=
s
 not normally something one needs to worry about.  Return values > 0 will=
 be
--=20
2.17.0


--C0dUBgQp3Dhd45b44hB7XhVUbCxfDpTXf--

--aS3VDlDxg6F3C6UjJ1TCTUkST2M7956IT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGTBAEBCgB9FiEEkGEdW86NSNID6GAoPuiP7LShEG4FAlsGI35fFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldDkw
NjExRDVCQ0U4RDQ4RDIwM0U4NjAyODNFRTg4RkVDQjRBMTEwNkUACgkQPuiP7LSh
EG7bMwf6Ax50H6Ouf9HWESG6kx7M3Jbw+2LV+9kz6GocOXWYsg3O9tQyk6HwBcTJ
Cxq7QW+gmQR5nU9M7PZ4SReLtWpQAEJzcYh5phnCHxEB1rvw7PXlIgkrJGutbx4W
wHaObqx//u98X3AgTVnipxcp7MCWakxuxT1bIkI6Ti6FgKONE6EpqRxpP1fpqHcx
X1IIavDhbSnEc9sG5qKGqUzW1eIgGOnW/W2cSA8+PiMHcDNGBPgaN4hDVP+rG9fA
tbudNTqyRffxdWvskosg7lR8NbuT9YOdbcSAyb7G43BGToUN2m1o2i2FKmq85Q4N
yj73ugpKXTtYkIdMp6VwIJa1uEtFXA==
=6mdz
-----END PGP SIGNATURE-----

--aS3VDlDxg6F3C6UjJ1TCTUkST2M7956IT--
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
