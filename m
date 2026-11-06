Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793995944;
	b=Myk80GGlIbYPXZ9sasa0nvi+r2PUEGXF1loF5ozQuksdq9uEIQQkbdfuzeCKhyHC56Bw
	 dQOKKHAyhX1flOcj8J6Q50X7Tj1l6ZE7Du03WGcrHaXsDJO+V6cjO7pLTeKA9AeBxPmEB
	 vvMZ0YJkOq6+RbwC6+tpTbP9HD+h6TqR0tmd7zE7Jb5DTSSi+NGcoxs9IN6UF/EcXBAIP
	 0+D6Bu8MWF1dt4AQxYOf/UeriV/vBTvuqdlx6ycqCWodBjrPlHEuVKIWHuJLJmSFWIfpF
	 btyGFXUgrggTpWGs58GqRwESusIngd/Tewi1l3bH4swMoCAYn/ZaszPLPgJIhq9Sp3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793995944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=Qrlz6fT5MJk8A9WNwfgrVZH+1NgxsGyPwS3ygdVEOkw=;
	b=4xg8Ov446i/R8YNF675sYCohYJ52wwJM6TDrFhMUgYBRP+TMPcHIGTLuBHiuXc1HC36s
	 BW2lSpumspotgaGU4LqWir8KpZgzxZuLmp/7wUAtuMOxWN/OqBlu6cnqDmkpO8ZyK2Op8
	 NMMb7VQZQHjVr6FdsaPq7JQaCoSFTSoVTmdKPpE6xhzs5XjVLR+SK2ZcYQdHTPVNXoN5X
	 J2/1S5LSAieR2eEArPEP0USv4ZxbIMy920bHDL4Iqww+ELf9mjlHtUObQAA6ih495kYSa
	 z5LKh/tzuJ+iDaUlUypXqFfgvn7jacXjFP4MQOKCI3cVsEvjZEqDo46f6qFELqR+ExQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lAXEBUHD;
	arc=none smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB5A606A32C
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 20:12:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCB5A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lAXEBUHD
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67c05273c38so1111461d50.1
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 12:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793995943; x=1794600743; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Qrlz6fT5MJk8A9WNwfgrVZH+1NgxsGyPwS3ygdVEOkw=;
        b=lAXEBUHDJaPc1fjhVVeCiHNKFq/6qK4rr5ZPtPjXNcSI1RLNlc5cERFb4Qwx9xZL4X
         l+Ep6NV6VHL3DUxMuvC0TniRlGZBvVE4PZXMYmrAjZzBHu/oEDlpzlWz8uxM3OxAvUXv
         b/V01EmPebWbw6v2z75ErsWqKCRM/UgwPP4er7ABEQuoAWHbaAbTtrQ8Sh1JS354l9OD
         CmnvdUU1CDXMycD1vFqqR958oS5yA/Sv6A0YwOJzKfpYjdt0lRwX6kT8Eo7o7G9ubPdU
         h0AEoI+c+MYfnxZKf2wXaplrjZtfBcrDz6YkQWdm/rR7oTOEfl5N9pma8Kd4syY3iasB
         0maA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793995943; x=1794600743;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Qrlz6fT5MJk8A9WNwfgrVZH+1NgxsGyPwS3ygdVEOkw=;
        b=JLj3hfKwSJhsMx1u6m1NkZaekW9eWAntgY5H9f1n4oaZntzHsNusboWO6SbxO0Tj1Z
         4I2Trau4wtZ3LGPwE+hT5pw6FtItR42h8/zcI8+xBQLfLDIu5vOKCaMx93rywTHG8rn9
         rLENIfV1K0ihpv/uxAEniKTYn+Uns8UzFD7bf6gKNZWUCsEQcTtaCaoBGK/gWYEspuoc
         CQH+GbmVbVUDHO11tiRp5o7IleiLir9DqFNBkljisXwUJMReQ3hWfX1OwQ+5n6laefCm
         zd0t470gGluxS6tfghe3opNMoVpuK5AjDvqkezh+Nmypp3+P8kcXM0nCW8f9J6YU0kfs
         ozzQ==
X-Forwarded-Encrypted: i=1; AL+hErEwgzANs7aFkIybVMtAS6aKwXNu2o0goG7Q++6zefIc2qqP+sz1AuYol5nqiabtSBrwxRjtjtsNbsM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VXqwCAAamdv49pMwXhZJrHWbsh8WzNCxnS7lBzmUxBZz5rmGe
	aZBgFkpR8Lw/iIcr2IcR8ZSF0L1HnUfqGbyGr/QDDlwFDRLm78Lzufmg
X-Gm-Gg: AYBFou27ERwKSvTu466S6lf00TktHMhYlvom0t+M1b/80REstC4rsdCTbhZDTMFhssp
	QrJInBGoQOC6jsjC9BdQ96S9+bkSMFl2GHtq3Yv8gzQQtA36mYAQpUCCfNwxRrhyMgvr00Ldnev
	SRkfOn1aU7UWoi4HbIm1MhGn7Bwb45xU2J9if5f8hrDGWAqDFOno07eQwGoPfmhBaCmNPCurKih
	5mR8mvD4T22rwpc7R2He0TIUJ6yVpsjwZSJmvNPIOi48oniBfmbRzDL2MeWhl0APhZ/x2JdTyx2
	YvT1g20+8dib/WOfikB1u/YkZs0KZSy9Glc+D+m2QjHzWrX807Uf3LoYYYI6mxYX/C2XlQ2336h
	8she+ycZSe18fi0f5pRYdHxXcFNB0foCAALYL7U5oSIJAY+zcdGynjopC2Bkbxv7nDEM4KQrP38
	3NKwRptWfEjEGbKNGO42tfoH0Oj0ZNyi82rnEmqU6h+NfLp1CtM/hGm84Xuw/39yKiq6A0Oww9r
	6hmRLAu/UWNjt0Zy9JQUCJtwYl9g+BQuu0Nn1S6NDLdYVKknsZRe6ryptZsBAOlsioK2Q3O1b10
	gh9BNkxhycdiNfeie9tPosUxYA==
X-Received: by 2002:a05:690e:14c4:b0:67c:2491:3754 with SMTP id 956f58d0204a3-67c2491394emr817731d50.81.1793995942713;
        Fri, 06 Nov 2026 12:12:22 -0800 (PST)
Received: from localhost ([2a03:2880:30ff:2::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c135cbccfsm2642686d50.17.2026.11.06.12.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:12:22 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Subject: [PATCH net-next v3 0/5] psp: support rekeying psp protected tcp
 connections
Date: Fri, 06 Nov 2026 12:12:08 -0800
Message-Id: <20261106-psp-v3-0-a8dd38f5a727@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJg07moC/02MQQ7CIBREr9L8tRgKhVpX3sO4QPppSSw00JCap
 ncX0Rg3k0xm3tsgYrAY4VxtEDDZaL3LhR8q0KNyAxLb5w6MMklzkDnOhOsTMiOFFrqB/JwDGrs
 WyxUcLsThusAtL6ONiw/Pok912b+mpphSTSgRhvIGWW8Ul5dhUvZx1H4qfGI/pqa0+zDszYhOq
 rugRrbtP7Pv+wuBkyEi1AAAAA==
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.13.0

A note on v3:
To keep this series short, I have split off some of the content that
appeared in v2, and also have planned future work that will make this
feature more robust, but not necessary to start. Here is the current
queue of follow up series:
 1. core tracked tx-key-count stat and SADB drain test case (from v2). I
    see this as able to stand alone as a series, and I also would like
    to report key deletion errors, but will have to touch mlx5 for that.
 2. core to end grace period if BQL is stalled. I think this deserves
    its own series for human discussion.
 3. Rate limiting rekey uAPIs. This has been suggusted by the bot, but
    whether or not it is needed depends on a bit on the deployment
    model.

Original cover letter:

The PSP architecture spec states the need for rekeying connections in
the event of a device key rotation. After a device key rotation has
occurred, a new rx derived key needs to be generated and sent out to the
other end of the connection sometime before the next device key rotation
occurs.

Because PSP connections involve two different keys at each endpoint,
one for decrypting ingress traffic, and one for encrypting egress
traffic, there are two types of rekeying events that need to be
supported. From the perspective of one endpoint of the connection:

1. rx rekey: we need to allocate a new spi + decryption key pair to
   provide to our peer.

2. tx rekey: our peer has provided us with a new spi + encryption key
   pair which we should use for encrypting traffic immediately.

In the case of rx rekeying, there is a period where it makes sense to
accept packets authenticated from either the previous or current spi. To
deal with that, we allow a psp_assoc to remember the last spi that was
valid on a socket due to a rekey. If authentication state does not match
the most recent assoc, the stored state from the previous assoc will be
tried.

In the case of tx rekeying, as soon as we install the new tx key, we
have no use for the previous one, and it can be disposed of immediately.
The only catch is in the case where hw uses a key handle in tx
descriptor state, as opposed to inlining the key directly. In this
case, psp core needs to be sure that any of these unaccounted for
references to key state are gone by the time it tries to sync a deleted
key to hw.

To deal with this race condition, we introduce a different path to key
deletion for psp_assocs removed from the socket during a tx rekey. psp
core will use bql byte counters filled out by the driver to determine a
conservative grace period where key handles can be disposed of.

Lastly, some test cases for rekeying are included that go through key
rotations and rekeying.

There are some packetdrill tests that are queued for upstreaming [1].

Future work can include a time based rate limit on the rx-assoc/tx-assoc
uAPIs to prevent an untrusted user from creating lots of wasted PSP
assocs and consuming SPIs, SADB space, etc. For now, users should use
network namespaces, or otherwise not present PSP devices to users that
could abuse this.

[1]: https://github.com/danieldzahka/packetdrill/commits/psp-rekey/

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
Changes in v3:
- psp: support rx rekey operation
  - move the replaced assoc to psd->stale_assocs, so a rotation
    racing with its free doesn't count it in stale-events
  - drop the requirement that the new rx spi has the opposite phase
    bit from the previous one
  - keep prev_generation valid across a rotation when the prev SPI is
    from the same generation
  - document rx rekey in the rx-assoc op doc in psp.yaml
- psp: support tx rekey operation
  - move the replaced assoc to psd->stale_assocs, so a rotation
    racing with its free doesn't count the socket twice in stale-events
  - document that the previous rx SPI also stops being accepted once
    its device key is rotated out
  - drop the claim that the peer accepts both the old and new SPI
    after a tx rekey
  - document tx rekey in the tx-assoc op doc in psp.yaml
- psp: defer tx key deletions for SADB drivers
  - document that Tx descriptors must be completed or discarded
    before psp_dev_unregister()
- selftests: drv-net: psp: factor out psp connection setup
  - take key lengths from the kernel's rx-assoc reply instead of a
    per-version table
  - close the data socket in psp_responder if conn_setup_psp() fails
- selftests: drv-net: psp: add rekey tests
  - drop test for rx rekey rejected without a device key rotation
  - fail fast in _recv_careful() if the peer closes the connection
  - in the basic rekey tests, run traffic across a rotation before the
    rekey, and rotate again after it to verify the new key is in use
  - drop unneeded key rotation from rekey_rx_version_mismatch()
  - carry the key length in the responder's assoc message instead of
    deriving it from the version
- psp: add core tracked stat for outstanding tx keys
  - moved to a follow-up series
- selftests: drv-net: psp: add a tx rekey drain test for SADB drivers
  - moved to a follow-up series
- Link to v2: https://lore.kernel.org/r/20261009-psp-v2-0-5596ab50f677@gmail.com

Changes in v2:
- psp: support rx rekey operation
  - copy old rx state by value instead of pointer to prev
  - place non-datapath fields at end of struct psp_assoc
  - disallow rx rekey when socket is not in full psp state, or
    dev/version doesn't match
  - require the new rx spi to have the opposite phase bit from the
    previous one
- psp: support tx rekey operation
  - place new assoc on pas->assocs list instead of psd->active_assocs
  - disallow tx rekey when socket is not in full psp state
  - document rekeying in psp.rst
  - reject tx rekey on SADB devices until deferred tx key deletion
    lands
- psp: defer tx key deletions for SADB drivers
  - replaces "psp: add driver api for deferred tx key deletion"
  - use bql byte counters instead of driver callback for grace periods
  - only defer tx key deletion when socket outlives psp_assoc
  - document driver requirements in psp.rst
  - allow tx rekey on SADB devices
- psp: add core tracked stat for outstanding tx keys
  - replaces "psp: add core tracked stats for deferred key deletion"
  - drop grace-periods stat
  - rename tx-key-cnt to tx-key-count, only report it for SADB drivers
  - warn about outstanding tx keys in psp_dev_unregister()
- selftests: drv-net: psp: factor out psp connection setup
  - split psp_responder conn_setup_psp() into rx_assoc() and tx_assoc()
  - drop Reviewed-by from Willem due to psp_responder changes
- selftests: drv-net: psp: add rekey tests
  - add tests for rekeys rejected due to psp state and version
    mismatch
  - add test for rx rekey rejected without a device key rotation
  - add rx-assoc, tx-assoc, and key-rotate rpcs to psp_responder
- selftests: drv-net: psp: add a tx rekey drain test for SADB drivers
  - new patch
- mlx5: psp: implement deferred tx key deletion
  - dropped, bql based grace periods need no driver callback
- Link to v1: https://lore.kernel.org/r/20260204-psp-v1-0-5f034e2dfa36@gmail.com

To: Daniel Zahka <daniel.zahka@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: David S. Miller <davem@davemloft.net>
To: Eric Dumazet <edumazet@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Simon Horman <horms@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Randy Dunlap <rdunlap@infradead.org>
To: Donald Hunter <donald.hunter@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>
To: Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org

---
Daniel Zahka (5):
      psp: support rx rekey operation
      psp: support tx rekey operation
      psp: defer tx key deletions for SADB drivers
      selftests: drv-net: psp: factor out psp connection setup
      selftests: drv-net: psp: add rekey tests

 Documentation/netlink/specs/psp.yaml               |   8 +-
 Documentation/networking/psp.rst                   |  68 +++++-
 include/net/psp/functions.h                        |  10 +-
 include/net/psp/types.h                            |  35 ++-
 net/psp/Kconfig                                    |   1 +
 net/psp/Makefile                                   |   2 +-
 net/psp/psp.h                                      |   8 +-
 net/psp/psp_deferred_del.c                         | 231 ++++++++++++++++++
 net/psp/psp_main.c                                 |  22 +-
 net/psp/psp_sock.c                                 | 114 ++++++++-
 tools/testing/selftests/drivers/net/psp.py         | 269 ++++++++++++++++++++-
 .../testing/selftests/drivers/net/psp_responder.c  | 197 +++++++++++++--
 12 files changed, 909 insertions(+), 56 deletions(-)
---
base-commit: bb67589c87249c9bc2415ab11a754d6e303774e3
change-id: 20260202-psp-3c8e2f65c5c4

Best regards,
-- 
Daniel Zahka <daniel.zahka@gmail.com>

