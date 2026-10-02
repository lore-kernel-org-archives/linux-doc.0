Received: from mail-qv2-f40.google.com (mail-qv2-f40.google.com [74.125.230.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F632D7DC8
	for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2026 06:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790922969; cv=pass; b=s5rFfCyY00itccqVapyBfbl0k6KRqMatDFvxOoaD7zF7qE7O5NicyxBIYCN3cNxwF/57gH/j9qat0QihDhhI/A5n/p/kqQ3Q2gBToeW/EZx7JI7Le/HDHq4J9LoahgZ0LkbOl6w7KpGQP9szhsf9fWj2h8X1mOHjX4TfDPZ6t+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790922969; c=relaxed/simple;
	bh=3S1uZs1hII2pWOKPYQNkil7Fn4cNrtQ1UC0K0UrYm/g=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=mBZcoWe5DIZnJUwNOd0aI8qeOsUQeeUoNXDVQxTkpFkZU2Hzs9+e04OUSA65INoccFO/esZnisjz/48WnS5nvsUq8t8xkERp2k56ER0rw23xsgUdG0Zo5HLThiC/ziKDJ0C2gBo4cGu7JJZLSpv22XTKVWSJL1fWbsiCtUVa5gU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rB/jwKfq; arc=pass smtp.client-ip=74.125.230.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rB/jwKfq"
Received: by mail-qv2-f40.google.com with SMTP id 6a1803df08f44-917b200d49bso17317076d6.2
        for <linux-doc@vger.kernel.org>; Thu, 01 Oct 2026 23:36:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790922967; cv=none;
        d=google.com; s=arc-20260327;
        b=rUh7zzIva2KdNq2XaL06ANAorlFVKCZV6z4uLnXf+b0kOB5Wdh7K6o3YLtde7fDZy6
         hId34uXpl1+BZGfX5lJsOgaM1i9aG7Eeyx+C+cQDgjfkRAxRNQWH3oE5K4Rt3qMj8w1C
         Ux7qLONObrrg4zFMiY526/wDy+Zd8WHdqMDobQN9+2A3OCt8hR7E9qBEnqFFEuHdrQS0
         XBxaU/t6mb62tJZDoMrQoRRLF7HZo4W/+Q3estkqqE1hjtuvUzYADWPGhtgpQ2vcLKat
         aMNzqtx4IVq/kVR8rPf2LFLtB1I6ev7qN9Etnl0I44ZGP0GrLmgvKJINYUGn+oEI03UQ
         tVkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=XEUnD7DqqTtUtcDjYvQugZu8ealQJ2hIum6Bu4MZjiI=;
        fh=dLqIYUvDyCbx5ctgk+EY/1xMlCArFdT+3+6InTx2ORY=;
        b=Aa4mkRq3YDF8GUEROJTZXLEpothfuUnYBKFLi1bZQ+P9E9TsKT0SA8ntnLjv2LpEBG
         EL1kDX5ihda9A8kCxOzYWV9/PZ7Rarqhd4O+1O19dMw4L+2Od/PaL7tiKEiJemPaKcfr
         ZCNIqiwaF8TCUuOt5MOZG+IP7pvKNLr5qq1NBTDgW9aQpb0YWx/oz4CEAaa0yQ5yC6Bn
         MLxTPpzyzEVngFf4HWW3Zq9h0Wm8VZTXYUjgQr45oWdpWciR6sdQUD3IUGiy0NhXydqW
         UyRCiJfZYvO9bm12a+kciaAdE3GkxpIH8CZqKVbKdsMSFPtPZz5fPX4E+OCKXFWM6nB5
         cCkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790922967; x=1791527767; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XEUnD7DqqTtUtcDjYvQugZu8ealQJ2hIum6Bu4MZjiI=;
        b=rB/jwKfqAc8b/Mimi6xHXJ0Y1EjA1k9uFGQxlxSUJP9DY5KS9/JQeAXRKyRkqeSn8o
         P60PWpZ/yZfu+glJ8qBJBFZyCTgLTKuH1yvRR3Ms6kL7g1yULX6B0hlsPR7ejpMADZY9
         om9LFohlBug3ELBeXaoIsgq/yMU6gqc26CvtSwiheRmgX3V6haELGWS9orhdTWFwyOPa
         1o2gbmJIIogrS0fbyi2EvRozrjDRk5avtc1ozHHBSsE7sm/zV76cCi4erUyK3mOD0o1H
         1Vs3FHQb1Wj7IvIQJJmw780oLJLnFS+ESP2MddA+po2sf75Ny3+sobXs+mdKMmMJ+15Z
         ioLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790922967; x=1791527767;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XEUnD7DqqTtUtcDjYvQugZu8ealQJ2hIum6Bu4MZjiI=;
        b=Bn4N8X39y6fXxaYqP1B3y29tQrNjLnB/P1FpijKcynaLWw4uWsH6H4qJDtMsl//Lsu
         +poHz5qTizQ3Nhr/7d8aCVVcCdExcLMbOAxrDg066uLpPxfytBmIeh1bsT+cB+wW5C0K
         vQnpYIMHGKSccmJoT23qWpI9WTDgUUZfp1+D7tG4iYiMuU+6Syl3jz26SbuOTJ4UfzDW
         /+gh4zoS/fz7l5F+FUcjp7oZtxaKZlp53cwB2U/jNOtVlSx2FGW2S9kilhBotBwKB+79
         yyFyFtU4gpixZzH0pwuC8gDhcmyXK5QrQOtpRPH/L5Qtvy/gI6G8SPg+QXC33b//XVOJ
         dITw==
X-Forwarded-Encrypted: i=1; AKwUvBzHRb6x5iBlv6RBnY8auQi5CozrYFR+/B3rBeqCGNMgL0NkbvHf434EhOLlmE5nWcmg69lqt5sP0Ns=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyqSPX3BZEaunfguF3fb7f9DE7t5F128tBf7o3zC/EWQesRfoz
	9i3Wu9L0ZGKmBtIDc5t7SzHBiM1sljPVdY2ppY94r9NC70oPcLGVSir719Fp8DbAjVNH2EKSTFF
	pAEv45hmdjxdC3llu6YxudVlmLEZy3mkTgA6T
X-Gm-Gg: AYBFou2I+MmnPIYQ1s6t0SzRU91+nWux8tgP7X6ZwTxSrqxt7x4ZzL5qhxlx8YdgGy0
	hhJ4GtniwEG9LpORjv8BCMf43LTpJEh25gCl9l5yR2uyo0xaTCTg6mRoBh2Q7h3AHCXPjdrsQdG
	mg0rDt85Liw0p8LfnWl6hm8HkEoHR4g4XOWOl9iyjoFeSyjwuR6VIetqWgEtoz5OfU7R6Q7gLHY
	yuqQTSY5WQMUKO47BY/sb2wCXv+2V9BK1n6zm2ZHpiu/Crap+Zq0BjLwoR8ZL7M0Ba9EpLCLiH5
	OqOPE4/b5ZiWulrBguCFuCbmbFxhrKOnqLo4V/XVlk93zC1oca2hDZuHS0WbkkOM3Ja/qgJ10Xq
	60DEZk9E=
X-Received: by 2002:a05:6214:250b:b0:917:9407:ebe6 with SMTP id
 6a1803df08f44-917c01f8f37mr34918186d6.45.1790922966450; Thu, 01 Oct 2026
 23:36:06 -0700 (PDT)
Received: from 313336824172 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Oct 2026 01:36:05 -0500
Received: from 313336824172 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Oct 2026 01:36:05 -0500
From: aljojobypls@gmail.com
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 2 Oct 2026 01:36:05 -0500
X-Gm-Features: AclHuK-eOHG-KjrKk1EnhSAW8Anv2gpdAShX7kyS6osGEORvuk9-xVyj6NCHZdM
Message-ID: <CAPNiJxAHw90Ndv_NoEi5PeqO4mRnw9S9vx-es3F0NNt2nbV2cw@mail.gmail.com>
Subject: [PATCH] ntfs3: do not trust setuid and device nodes from WSL metadata
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

ntfs_get_wsl_perm() copies $LXMOD over the inode mode, including the
file type, setuid, setgid and the sticky bit, and $LXDEV supplies a
device number. Those attributes are stored on the volume.

A crafted NTFS image can therefore present a setuid-root binary or a
device node. cp -a and rsync -a copy that mode onto a normal Linux
filesystem. The nosuid,nodev flags on the ntfs3 mount do not travel
with the copy.

Keep the stored owner and the rwx bits. Keep the file type already
derived from the MFT, and drop setuid, setgid, the sticky bit and
device nodes. -o permissions restores the previous behavior for a
volume the operator trusts, such as a WSL disk that really contains
setuid binaries.

Fixes: be71b5cba2e6 ("fs/ntfs3: Add attrib operations")
Cc: stable@vger.kernel.org
Signed-off-by: Aljo Joby <aljojobypls@gmail.com>
---
 Documentation/filesystems/ntfs3.rst |  9 ++++++++
 fs/ntfs3/ntfs_fs.h                  |  1 +
 fs/ntfs3/super.c                    |  7 ++++++
 fs/ntfs3/xattr.c                    | 35 +++++++++++++++++++++++------
 4 files changed, 45 insertions(+), 7 deletions(-)

diff --git a/Documentation/filesystems/ntfs3.rst
b/Documentation/filesystems/ntfs3.rst
index 2b86a9b3a..260f73228 100644
--- a/Documentation/filesystems/ntfs3.rst
+++ b/Documentation/filesystems/ntfs3.rst
@@ -109,6 +109,15 @@ this table marked with no it means default is
without **no**.
        Kernel. Not to be confused with NTFS ACLs. The option specified as acl
        enables support for POSIX ACLs.

+   * - permissions
+     - Trust the WSL metadata stored in \$LXUID, \$LXGID, \$LXMOD and \$LXDEV.
+       This includes the owner, setuid, setgid, the sticky bit and device
+       nodes. Without this option the driver still applies the stored owner
+       and the rwx bits, but it keeps the file type it read from the MFT and
+       drops setuid, setgid, the sticky bit and device nodes. Mount a volume
+       with this option only when you trust it, for example a WSL disk that
+       legitimately contains setuid binaries.
+
 Todo list
 =========
 - Full journaling support over JBD. Currently journal replaying is supported
diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
index 5811d89d6..267d980f7 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -111,6 +111,7 @@ struct ntfs_mount_options {
 	unsigned nocase : 1; /* case insensitive. */
 	unsigned delalloc : 1; /* delay allocation. */
 	unsigned ads : 1; /* ads support. */
+	unsigned permissions : 1; /* Trust on-disk WSL uid, mode, devices. */
 };

 /* Special value to unpack and deallocate. */
diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index f4a42a0c7..863126e87 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -275,6 +275,7 @@ enum Opt {
 	Opt_delalloc_bool,
 	Opt_ads,
 	Opt_ads_bool,
+	Opt_permissions,
 	Opt_err,
 };

@@ -303,6 +304,7 @@ static const struct fs_parameter_spec
ntfs_fs_parameters[] = {
 	fsparam_bool("delalloc",	Opt_delalloc_bool),
 	fsparam_flag("ads",		Opt_ads),
 	fsparam_bool("ads",		Opt_ads_bool),
+	fsparam_flag("permissions",	Opt_permissions),
 	{}
 };
 // clang-format on
@@ -432,6 +434,9 @@ static int ntfs_fs_parse_param(struct fs_context *fc,
 	case Opt_ads_bool:
 		opts->ads = result.boolean;
 		break;
+	case Opt_permissions:
+		opts->permissions = 1;
+		break;
 	default:
 		/* Should not be here unless we forget add case. */
 		return -EINVAL;
@@ -805,6 +810,8 @@ static int ntfs_show_options(struct seq_file *m,
struct dentry *root)
 		seq_puts(m, ",delalloc");
 	if (opts->ads)
 		seq_puts(m, ",ads");
+	if (opts->permissions)
+		seq_puts(m, ",permissions");

 	return 0;
 }
diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
index 594ef6860..5db154513 100644
--- a/fs/ntfs3/xattr.c
+++ b/fs/ntfs3/xattr.c
@@ -1036,6 +1036,8 @@ void ntfs_get_wsl_perm(struct inode *inode)
 {
 	size_t sz;
 	__le32 value[3];
+	struct ntfs_sb_info *sbi = inode->i_sb->s_fs_info;
+	umode_t disk_mode, type;

 	if (ntfs_get_ea(inode, "$LXUID", sizeof("$LXUID") - 1, &value[0],
 			sizeof(value[0]), &sz) == sizeof(value[0]) &&
@@ -1043,15 +1045,34 @@ void ntfs_get_wsl_perm(struct inode *inode)
 			sizeof(value[1]), &sz) == sizeof(value[1]) &&
 	    ntfs_get_ea(inode, "$LXMOD", sizeof("$LXMOD") - 1, &value[2],
 			sizeof(value[2]), &sz) == sizeof(value[2])) {
-		i_uid_write(inode, (uid_t)le32_to_cpu(value[0]));
-		i_gid_write(inode, (gid_t)le32_to_cpu(value[1]));
-		inode->i_mode = le32_to_cpu(value[2]);
+		disk_mode = le32_to_cpu(value[2]);

-		if (ntfs_get_ea(inode, "$LXDEV", sizeof("$LXDEV") - 1,
-				&value[0], sizeof(value),
-				&sz) == sizeof(value[0])) {
-			inode->i_rdev = le32_to_cpu(value[0]);
+		/*
+		 * $LXUID/$LXGID/$LXMOD/$LXDEV are stored on the volume.
+		 * A crafted image can claim to be a setuid-root binary or
+		 * a device node. Those bits are copied onto a trusted
+		 * filesystem by cp -a and rsync -a, even when this mount
+		 * itself is nosuid,nodev. Trust them only with -o permissions.
+		 */
+		if (sbi->options->permissions) {
+			i_uid_write(inode, (uid_t)le32_to_cpu(value[0]));
+			i_gid_write(inode, (gid_t)le32_to_cpu(value[1]));
+			inode->i_mode = disk_mode;
+
+			if (S_ISCHR(disk_mode) || S_ISBLK(disk_mode)) {
+				if (ntfs_get_ea(inode, "$LXDEV",
+						sizeof("$LXDEV") - 1, &value[0],
+						sizeof(value[0]),
+						&sz) == sizeof(value[0]))
+					inode->i_rdev = le32_to_cpu(value[0]);
+			}
+			return;
 		}
+
+		i_uid_write(inode, (uid_t)le32_to_cpu(value[0]));
+		i_gid_write(inode, (gid_t)le32_to_cpu(value[1]));
+		type = inode->i_mode & S_IFMT;
+		inode->i_mode = type | (disk_mode & 0777);
 	}
 }

-- 
2.53.0
