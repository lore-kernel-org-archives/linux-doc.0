Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793704524;
	b=hJeydbpQxyKF+/A82TyA7VoMVLl3Vd+PP41cSKO1ddP99wlfat/SjwIiFW4S9WlWHbdT
	 4YYU/bWzU7yQLw19AfT1/rbFirViKEbMRgV51j8EBeame3MpgMbcUxOqkjz122CjD8YhQ
	 h/jE8eGoqjO9IxjBF1BT8r2emfK0XXK+pJtUNdDxVn1jsCOGt3LcURTh9n4cLFgZ/qQ/8
	 l3/RNbIlgs7ikXrNkEZi3tbfgesf+7fVwVreoc++FUY5Y9lhIjqhC4EeKkEcChg+yN2EP
	 CTr2vZDUpae1tS0h8O8O0rRyKwLPPKUEWbzQsv8xwg1voyfOszQEG9qe6Hd8wdzKXjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=64eLKIzABCGMRTCPKyoihv0B/ctoU2YSp/wlJpw21Tk=;
	b=pKdR/7kxUg9jaTHK3lTSK+w5lLuyej93wcrCu+9OFshrpmLBhAMq5t2kUFRDBSai/PZw
	 w1nLOB2ZSsNMI980KFPTbeUvucfTSF09zvLaIFj7FITSyl1paR9xr51vaMXMDwWMWucdb
	 aWFOvOt/tGHplBm5JJFa43V8jjtlves15FZsIwvkLPK/MdFBsJBZC1MxMSH69N9s5GDMb
	 T5AT+04Yyl4X01Ejsm2GHgqN/IXI44NNMWhMSe46vGnbNJIxzEqnlvlfh8Ok4fnoDY2U9
	 WDDFjvnq+2iqs4N+BjH5+cf3E/rcOCafGaz6G9SMg4M6iogfhQxJ31pm1ojedSvvtmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LpFz8uvc;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF5D606B12C
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 11:15:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAF5D606B12C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LpFz8uvc
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so6082742a12.2
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 03:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793704522; x=1794309322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=64eLKIzABCGMRTCPKyoihv0B/ctoU2YSp/wlJpw21Tk=;
        b=LpFz8uvcVvR+mSx5Gy7n6+AqxUOdbIVxSHJToK5gjRJeb0OidtV9YOx7wAqQS2Wvc0
         G3xgUayx4Q4r9wb/gAqYeduSoiZD0+Uc/2naiO5Rxp7ycR/lS+qc18897hckrywcoB+P
         YoZgexVANBLA/wPr8j8QiOb/U+LGkPX79oPutaxOBPaKzHmQ42SqpaZ48XHl9VHkcfkW
         WkJjgPTuy3LwU0L6Jj5MVIGaa/wqB/5kEn3mcX4FFBeY4N/5Hqxih+EN3JtNbQBRCTps
         HqDykmfrKDgGdNkFjCJpBIYMsDKbjjwuFFDh3y0B6sQPqL6Vv3fFdkuAz+PRVT9vILw6
         jTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793704522; x=1794309322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=64eLKIzABCGMRTCPKyoihv0B/ctoU2YSp/wlJpw21Tk=;
        b=xg+99feS4sqeZ1vwaK5oJZRQOwAgAJYRPHxePQij3WVWdodxCCpyTX75JirRJW/irW
         I9i+Y+y2oSV/UL8Su/9oU4U1qovJN1NnmT1hLwEDIcaIBg7ZaB3vYYDC+rL2rFasf+03
         OwVMOuxJkRfxrlEFMyQeNUJol4ZJqpvmuDuEsoBB1Znnbws0T2r0P0CaIwezCOC04PaQ
         HK4WibJ3/HhNfmfALrqTK9U7Mg7qI8unnHAYyMV8XqW0WRVzRUVJyRZRhyYvesTitH6b
         B6a1upX+qplx+F1Kid5NVILbJ4lRCNvk7NjamnG9buE578S+FjMt00MjVAk5wFDr74KW
         5M+w==
X-Forwarded-Encrypted: i=1; AKwUvBxrXitLKHYXTi5UgFCxFyTj8PDia/KzqyhDJnnDYGES8eLIiJpzdJwSUvqSI+u8a3glSaS64beBga4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nibhZMQ6Be0p+OAOnXd8c3B9M4IzcPVLiH8z1SHb1N+zdfIiZ
	ajhsl6vadHE4KYLtpPY+FQs+t3yvYbGgMRKEJXELrskepRDTsVv9Ip9y
X-Gm-Gg: AYBFou1HJh07Trto7QeqlwaknQHjSB3HkNPv66suj73te6rjH3Tfli7dsw9EMs9Ecel
	74cYuZ8pF+RRZ5NcqJqJimV9I0DChDAyZSx30IdC1KUroGi3drlxPAE4niE7Om266gFn1h8ebkx
	n1XnveLnEA822Rbl8QgOcj503SLGIqtMge7aNUlr/w2nP4d0YaAqS0NQc785q2VCjYES2w9SmCa
	IuJXpO61cdWBPjPa/omy4i/zZC00suk26K9Zy9y1w8BexZWnP0Z5yuCtvIpgFMvygL7lHOHkMh+
	zYdRjLma4try8vXzk2UCb/t/sJ+eZIr+u/eK+vDcZYyC8PvJP2p1tTVtGBdELxpZ0wnAz6g3TmV
	6g061LdLElFHicdmWtonjlMOKBivQOmdPtOzExUKXyn8eY5UPZpJWZVXORU/PmEk5r22qk2vXkC
	Xy5uc7iaDbpJoF+ENhGDygpzJoaNor0WHo88JxGWtA45yPrVO1e8l4/VVs20+Q9npZXMCJNREo5
	ZQA73CAfvQv5wW0hkrnLb+cQlK3nD8IGpMqE6NvQaaCsej9Hs9Nw6ExpPuNoKr25V0VYKM3AAld
	TnZjtEEM2QggcpExY6Q/tP3n7mHcJu23aDyotqCg+Kzq/ONIHP5cusbnUXphrBFDdjNv8ZPY0IH
	AANnVt2rzMysohe+J6X1w+iSYy1cb29HIm3yUDwbq
X-Received: by 2002:a05:6402:a403:b0:6b1:cee3:9083 with SMTP id 4fb4d7f45d1cf-6b4d4f7119cmr6571862a12.28.1793704521937;
        Tue, 03 Nov 2026 03:15:21 -0800 (PST)
Received: from wlan-199066.nbw.tue.nl (wlan-199066.nbw.tue.nl. [131.155.199.66])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca0f376sm4349291a12.26.2026.11.03.03.15.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 03:15:21 -0800 (PST)
From: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Michail Andreas Michalopoulos <mike.michalo@gmail.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tom Talpey <tom@talpey.com>,
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	Enzo Matsumiya <ematsumiya@suse.de>,
	linux-cifs@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ksmbd: add AES-GMAC signing support
Date: Tue,  3 Nov 2026 12:14:53 +0100
Message-ID: <20261103111453.84804-3-mike.michalo@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103111453.84804-1-mike.michalo@gmail.com>
References: <20261103111453.84804-1-mike.michalo@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SMB 3.1.1 adds AES-GMAC as a signing algorithm that clients can
negotiate in the SMB2_SIGNING_CAPABILITIES context (MS-SMB2 3.1.4.1).
Windows and Samba support it.

Implement it with the AES-GCM library: the message, with its Signature
field zeroed, is authenticated as associated data with nothing
encrypted, and the 16-byte tag is the signature. The 12-byte nonce is
the MessageId followed by a 32-bit value with bit 0 set for messages
from the server and bit 1 set for SMB2 CANCEL.

Also accept AES-GMAC from the client's list of algorithms, and refuse
to bind a channel to a session if only one of them uses AES-GMAC, with
the same status codes as Windows (checked by smbtorture's
smb2.session.bind_negative_smb3sign* tests): STATUS_REQUEST_OUT_OF_SEQUENCE
for an AES-GMAC session and STATUS_NOT_SUPPORTED for an AES-GMAC
channel. These responses keep the SMB2_FLAGS_SIGNED flag like the other
binding errors, as clients reject unsigned responses to signed requests.

Mark the feature as supported in the ksmbd feature status table.

The nonce format follows Enzo Matsumiya's AES-GMAC series for the SMB
client and Samba's implementation.

An AI assistant was used to draft the patch and as an independent
reviewer. Testing is described in the cover letter.

Signed-off-by: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
---
 Documentation/filesystems/smb/ksmbd.rst |  2 +-
 fs/smb/server/Kconfig                   |  1 +
 fs/smb/server/auth.c                    | 46 +++++++++++++++++++++++++
 fs/smb/server/smb2pdu.c                 | 35 +++++++++++++++++--
 4 files changed, 80 insertions(+), 4 deletions(-)

diff --git a/Documentation/filesystems/smb/ksmbd.rst b/Documentation/filesystems/smb/ksmbd.rst
index 728cfca1320..59c98c53d78 100644
--- a/Documentation/filesystems/smb/ksmbd.rst
+++ b/Documentation/filesystems/smb/ksmbd.rst
@@ -118,7 +118,7 @@ SMB3.1.1 Compression           Supported.
 SMB3.1.1 over QUIC             Planned for future.
 Signing over RDMA              Under development.
 Encryption over RDMA           Supported.
-SMB3.1.1 GMAC signing support  Planned for future.
+SMB3.1.1 GMAC signing support  Supported.
 ============================== =================================================
 
 
diff --git a/fs/smb/server/Kconfig b/fs/smb/server/Kconfig
index f8b03605db5..30523ca165e 100644
--- a/fs/smb/server/Kconfig
+++ b/fs/smb/server/Kconfig
@@ -8,6 +8,7 @@ config SMB_SERVER
 	select NLS_UCS2_UTILS
 	select CRYPTO
 	select CRYPTO_LIB_AES_CBC_MACS
+	select CRYPTO_LIB_AES_GCM
 	select CRYPTO_LIB_ARC4
 	select CRYPTO_LIB_MD5
 	select CRYPTO_LIB_SHA256
diff --git a/fs/smb/server/auth.c b/fs/smb/server/auth.c
index 78e35f21746..f650bdd0beb 100644
--- a/fs/smb/server/auth.c
+++ b/fs/smb/server/auth.c
@@ -13,6 +13,7 @@
 #include <linux/xattr.h>
 #include <crypto/aead.h>
 #include <crypto/aes-cbc-macs.h>
+#include <crypto/aes-gcm.h>
 #include <crypto/md5.h>
 #include <crypto/sha2.h>
 #include <crypto/utils.h>
@@ -501,6 +502,46 @@ void ksmbd_sign_smb2_pdu(struct ksmbd_conn *conn, char *key, struct kvec *iov,
 	hmac_sha256_final(&ctx, sig);
 }
 
+/*
+ * AES-GMAC signing (SMB 3.1.1, MS-SMB2 3.1.4.1): AES-128-GCM with the
+ * whole message as associated data and nothing encrypted. The nonce is
+ * the MessageId followed by a 32-bit word whose bit 0 is set for messages
+ * from the server and bit 1 for SMB2 CANCEL.
+ */
+static void ksmbd_sign_smb3_pdu_gmac(char *key, struct kvec *iov, int n_vec,
+				     char *sig)
+{
+	struct smb2_hdr *hdr = iov[0].iov_base;
+	struct aes_gcm_key gcm_key;
+	struct aes_gcm_ctx gcm_ctx;
+	struct {
+		__le64 mid;
+		__le32 flags;
+	} __packed nonce;
+	int i;
+
+	static_assert(sizeof(nonce) == GCM_AES_IV_SIZE);
+	nonce.mid = hdr->MessageId;
+	nonce.flags = 0;
+	if (hdr->Flags & SMB2_FLAGS_SERVER_TO_REDIR)
+		nonce.flags |= cpu_to_le32(BIT(0));
+	if (hdr->Command == SMB2_CANCEL)
+		nonce.flags |= cpu_to_le32(BIT(1));
+
+	/* This cannot fail, since we always pass valid lengths. */
+	if (WARN_ON_ONCE(aes_gcm_preparekey(&gcm_key, key, SMB3_SIGN_KEY_SIZE,
+					    SMB2_SIGNATURE_SIZE))) {
+		memset(sig, 0, SMB2_SIGNATURE_SIZE);
+		return;
+	}
+
+	aes_gcm_init(&gcm_ctx, (const u8 *)&nonce, &gcm_key);
+	for (i = 0; i < n_vec; i++)
+		aes_gcm_auth_update(&gcm_ctx, iov[i].iov_base, iov[i].iov_len);
+	aes_gcm_encrypt_final(&gcm_ctx, sig);
+	memzero_explicit(&gcm_key, sizeof(gcm_key));
+}
+
 /**
  * ksmbd_sign_smb3_pdu() - function to generate packet signing
  * @conn:	connection
@@ -518,6 +559,11 @@ void ksmbd_sign_smb3_pdu(struct ksmbd_conn *conn, __le16 signing_algorithm,
 	struct aes_cmac_ctx cmac_ctx;
 	int i;
 
+	if (signing_algorithm == SIGNING_ALG_AES_GMAC_LE) {
+		ksmbd_sign_smb3_pdu_gmac(key, iov, n_vec, sig);
+		return;
+	}
+
 	if (signing_algorithm == SIGNING_ALG_HMAC_SHA256_LE) {
 		u8 mac[SHA256_DIGEST_SIZE];
 
diff --git a/fs/smb/server/smb2pdu.c b/fs/smb/server/smb2pdu.c
index 11994e6b92e..1f977741f30 100644
--- a/fs/smb/server/smb2pdu.c
+++ b/fs/smb/server/smb2pdu.c
@@ -1793,7 +1793,8 @@ static void decode_sign_cap_ctxt(struct ksmbd_conn *conn,
 
 	for (i = 0; i < sign_algo_cnt; i++) {
 		if (pneg_ctxt->SigningAlgorithms[i] == SIGNING_ALG_HMAC_SHA256_LE ||
-		    pneg_ctxt->SigningAlgorithms[i] == SIGNING_ALG_AES_CMAC_LE) {
+		    pneg_ctxt->SigningAlgorithms[i] == SIGNING_ALG_AES_CMAC_LE ||
+		    pneg_ctxt->SigningAlgorithms[i] == SIGNING_ALG_AES_GMAC_LE) {
 			ksmbd_debug(SMB, "Signing Algorithm ID = 0x%x\n",
 				    pneg_ctxt->SigningAlgorithms[i]);
 			conn->signing_negotiated = true;
@@ -2558,6 +2559,23 @@ static int krb5_authenticate(struct ksmbd_work *work,
 }
 #endif
 
+/*
+ * A channel can only be bound to a session signed with AES-GMAC if it
+ * negotiated AES-GMAC too, and the other way round. The status codes are
+ * the ones Windows returns, as checked by smbtorture.
+ */
+static int smb2_check_binding_signing_algorithm(struct ksmbd_conn *conn,
+						struct ksmbd_session *sess)
+{
+	if (sess->signing_algorithm == conn->signing_algorithm)
+		return 0;
+	if (sess->signing_algorithm == SIGNING_ALG_AES_GMAC_LE)
+		return -EPROTO;
+	if (conn->signing_algorithm == SIGNING_ALG_AES_GMAC_LE)
+		return -EOPNOTSUPP;
+	return 0;
+}
+
 int smb2_sess_setup(struct ksmbd_work *work)
 {
 	struct ksmbd_conn *conn = work->conn;
@@ -2615,6 +2633,10 @@ int smb2_sess_setup(struct ksmbd_work *work)
 			goto out_err;
 		}
 
+		rc = smb2_check_binding_signing_algorithm(conn, sess);
+		if (rc)
+			goto out_err;
+
 		if (conn->dialect != sess->dialect) {
 			rc = -EINVAL;
 			goto out_err;
@@ -2677,10 +2699,12 @@ int smb2_sess_setup(struct ksmbd_work *work)
 	} else if ((conn->dialect < SMB30_PROT_ID ||
 		    server_conf.flags & KSMBD_GLOBAL_FLAG_SMB3_MULTICHANNEL) &&
 		   (req->Flags & SMB2_SESSION_REQ_FLAG_BINDING)) {
+		rc = 0;
 		sess = ksmbd_session_lookup_slowpath(le64_to_cpu(req->hdr.SessionId));
 		if (sess) {
 			int sign_ret;
 
+			rc = smb2_check_binding_signing_algorithm(conn, sess);
 			work->sess = sess;
 			installed = true;
 			if (sess->dialect >= SMB30_PROT_ID)
@@ -2695,7 +2719,8 @@ int smb2_sess_setup(struct ksmbd_work *work)
 				sess = NULL;
 			}
 		}
-		rc = -EACCES;
+		if (!rc)
+			rc = -EACCES;
 		goto out_err;
 	} else {
 		sess = ksmbd_session_lookup(conn,
@@ -2823,12 +2848,16 @@ int smb2_sess_setup(struct ksmbd_work *work)
 		rsp->hdr.Status = STATUS_INSUFFICIENT_RESOURCES;
 	else if (rc == -EOPNOTSUPP)
 		rsp->hdr.Status = STATUS_NOT_SUPPORTED;
+	else if (rc == -EPROTO)
+		rsp->hdr.Status = STATUS_REQUEST_OUT_OF_SEQUENCE;
 	else if (rc == -EKEYREJECTED)
 		rsp->hdr.Status = STATUS_ACCESS_DENIED;
 	else if (rc)
 		rsp->hdr.Status = STATUS_LOGON_FAILURE;
 	if ((rsp->hdr.Status == STATUS_USER_SESSION_DELETED ||
-	     (rsp->hdr.Status == STATUS_INVALID_PARAMETER &&
+	     ((rsp->hdr.Status == STATUS_INVALID_PARAMETER ||
+	       rsp->hdr.Status == STATUS_NOT_SUPPORTED ||
+	       rsp->hdr.Status == STATUS_REQUEST_OUT_OF_SEQUENCE) &&
 	      (req->Flags & SMB2_SESSION_REQ_FLAG_BINDING))) &&
 	    (req->hdr.Flags & SMB2_FLAGS_SIGNED))
 		rsp->hdr.Flags |= SMB2_FLAGS_SIGNED;
-- 
2.43.0

