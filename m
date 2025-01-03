Received: from mail-m127166.xmail.ntesmail.com (mail-m127166.xmail.ntesmail.com [115.236.127.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8C433DF
	for <linux-doc@vger.kernel.org>; Fri,  3 Jan 2025 04:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.127.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735877218; cv=none; b=iYwwE0sMqf3Fn/ZqfdcTuRHB5aF7+H9R6Syem3iF9bR/uPXhcO6fsNdeBC0DA2ITbWZrEWFyGG5LxfCezdAla6Ux3SRYyXIiXo3GHaHwKVdQ6udtrophE238ewBjBs6+u4zV1uGW9lnGA360riVqbRI9afosMwwgepVxXEDCjiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735877218; c=relaxed/simple;
	bh=BOp1CQx3n9SYIostLEhjs3QJRqwdMhh3nkU+QsfGaKc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GQcHKsq1arHG7or29rhvrqz5JfoCQbrKGvSVMQb0Y0E+JVbRomh6+zPa+2aEE++45ikkeRJPydJQdJ1MVoCM8WADG0jlhQ+Xid+xFuwmVzcBlpsBFwWW203BYpXxmmfaGhILAusE6TGJ109Ng9oG/NSi5N506z2IAAx2mnz+4VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=Vq5lC/bx; arc=none smtp.client-ip=115.236.127.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="Vq5lC/bx"
Received: from localhost.localdomain (unknown [1.193.59.150])
	by smtp.qiye.163.com (Hmail) with ESMTP id 78e4ce27;
	Fri, 3 Jan 2025 09:44:29 +0800 (GMT+08:00)
From: zhangwei <zhangwei@cqsoftware.com.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: zhaoyuehui@cqsoftware.com.cn,
	zhaoshuo@cqsoftware.com.cn,
	linux-doc@vger.kernel.org,
	zhangwei <zhangwei@cqsoftware.com.cn>
Subject: [PATCH v2] docs/zh_CN: Add siphash index Chinese translation
Date: Fri,  3 Jan 2025 09:44:22 +0800
Message-ID: <20250103014422.2128-1-zhangwei@cqsoftware.com.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDQkwaVkJNT0JIGU5OSElNHlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUpCSFVOQlVKTktZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSExVSktLVU
	pCS0tZBg++
X-HM-Tid: 0a9429d5de1503abkunm78e4ce27
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Kzo6Dzo*TzIVLS5WTzwjFEJN
	NzEKCTRVSlVKTEhOQ01DTUxLTkxIVTMWGhIXVQETGhUcDB4SOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSlVKQkhVTkJVSk5LWVdZCAFZQUJKTEM3Bg++
DKIM-Signature:a=rsa-sha256;
	b=Vq5lC/bxF3s+hpC6LuJBXioahRCFBK4dwyE3hAyNLOTaOSbmvsbd5W4spx9aLaiGINOf0k0k8IJQZUGqXaMAjh8/hesNs2VHwhNDyXE/V77RKISYBq/GNBroaaXlo3aPd3H6q4WkiTcf/5p7gzcnsb8uEckPQyGmVm/teQ1bAVs=; c=relaxed/relaxed; s=default; d=cqsoftware.com.cn; v=1;
	bh=lgtYBQdmJRwKcls3cbFoNLM3HNLvxiZwm+cWfgHgvxY=;
	h=date:mime-version:subject:message-id:from;

Translate lwn/Documentation/security/siphash.rst into Chinese

Update the translation through commit 12fe434314c8
("Documentation: siphash: Fix typo in the name of offsetofend macro")

Signed-off-by: zhangwei <zhangwei@cqsoftware.com.cn>
---

v2:

Change the "生成钥匙" to the "生成密钥"
Complete the commit tag

 .../translations/zh_CN/security/index.rst     |   2 +-
 .../translations/zh_CN/security/siphash.rst   | 195 ++++++++++++++++++
 2 files changed, 196 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/security/siphash.rst

diff --git a/Documentation/translations/zh_CN/security/index.rst b/Documentation/translations/zh_CN/security/index.rst
index c73cd289ac3e..ceb700fe4561 100644
--- a/Documentation/translations/zh_CN/security/index.rst
+++ b/Documentation/translations/zh_CN/security/index.rst
@@ -16,6 +16,7 @@
    :maxdepth: 1
 
    lsm
+   siphash
    digsig
 
 TODOLIST:
@@ -27,7 +28,6 @@ TODOLIST:
 * sak
 * SCTP
 * self-protection
-* siphash
 * tpm/index
 * landlock
 * secrets/index
diff --git a/Documentation/translations/zh_CN/security/siphash.rst b/Documentation/translations/zh_CN/security/siphash.rst
new file mode 100644
index 000000000000..26dd8be699b3
--- /dev/null
+++ b/Documentation/translations/zh_CN/security/siphash.rst
@@ -0,0 +1,195 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+:Original: Documentation/security/siphash.rst
+
+:翻译:
+
+ 张巍 zhangwei <zhangwei@cqsoftware.com.cn>
+
+=====================================
+SipHash - 一种短输入伪随机函数（PRF）
+=====================================
+
+：作者: Jason A.Donenfeld <jason@zx2c4.com>
+
+SipHash是一种加密安全的伪随机函数，即一种用于生成伪随机密钥的哈
+希函数，因为其在处理短输入时表现出色，因此得名。其由密码学家
+Daniel J. Bernstein和Jean-Philippe Aumasson设计。目的主要是替
+代其他哈希函数，例如：jhash，md5_transform，sha1_transform等。
+
+SipHash采用一个完全由随机数生成的密钥，以及一个输入缓冲区或者
+多个输入整数，它输出一个与随机数难以区分的整数，你可以将它作
+为安全序列、安全cookies的一部分，或者对其进行掩码处理，以便在
+哈希表中使用。
+
+生成密钥
+========
+
+密钥应来源于加密安全的随机数生成，要么使用get random bytes
+要么使用get random once::
+
+        siphash_key_t key;
+        get_random_bytes(&key, sizeof(key));
+
+如果你的密钥来源不是这两个，那么你的做法是错的。
+
+使用函数
+========
+
+这个函数有两个变种，一种是接受整数列表，另一种是接受缓冲区::
+
+        u64 siphash(const void *data, size_t len, const siphash_key_t *key);
+
+和::
+
+        u64 siphash_1u64(u64, const siphash_key_t *key);
+        u64 siphash_2u64(u64, u64, const siphash_key_t *key);
+        u64 siphash_3u64(u64, u64, u64, const siphash_key_t *key);
+        u64 siphash_4u64(u64, u64, u64, u64, const siphash_key_t *key);
+        u64 siphash_1u32(u32, const siphash_key_t *key);
+        u64 siphash_2u32(u32, u32, const siphash_key_t *key);
+        u64 siphash_3u32(u32, u32, u32, const siphash_key_t *key);
+        u64 siphash_4u32(u32, u32, u32, u32, const siphash_key_t *key);
+
+如果向一个通用的hsiphash函数传递一个恒定长度的常量，他将
+在编译的时候将常量折叠，并自动选择一个优化后的函数。
+
+哈希表键函数的用法::
+
+        struct some_hashtable {
+                DECLARE_HASHTABLE(hashtable, 8);
+                siphash_key_t key;
+        };
+
+        void init_hashtable(struct some_hashtable *table)
+        {
+                get_random_bytes(&table->key, sizeof(table->key));
+        }
+
+        static inline hlist_head *some_hashtable_bucket(struct some_hashtable *table, struct interesting_input *input)
+        {
+                return &table->hashtable[siphash(input, sizeof(*input), &table->key) & (HASH_SIZE(table->hashtable) - 1)];
+        }
+
+然后，你可以像往常一样对返回的哈希存储桶进行迭代。
+
+安全性
+======
+
+SipHash有着非常高的安全性,因为其有128位的密钥。只要密钥是保密的，
+即使攻击者看到多个输出，也无法猜测出函数的正确输出，因为2^128次
+方个输出是非常庞大的。
+
+Linux实现了SipHash的“2-4”变体
+
+Struct-passing陷阱
+==================
+
+通常情况下，XuY函数的输出长度不够大，因此你可能需要传递一个预填充
+的结构体给SipHash，在这样做时，务必确保结构体没有填充空隙，最简单
+的方法就是将结构体的成员按照大小降序的方式排序，并且使用offsetofend()
+函数代替sizeof()来获取结构体大小，出于性能的考虑，如果可以的话，最
+好将结构体按右边界对齐，示例如下::
+
+        const struct {
+                struct in6_addr saddr;
+                u32 counter;
+                u16 dport;
+        } __aligned(SIPHASH_ALIGNMENT) combined = {
+                .saddr = *(struct in6_addr *)saddr,
+                .counter = counter,
+                .dport = dport
+        };
+        u64 h = siphash(&combined, offsetofend(typeof(combined), dport), &secret);
+
+资源
+====
+
+如果你有兴趣了解更多信息，请阅读SipHash论文:
+https://131002.net/siphash/siphash.pdf
+
+-------------------------------------------------------------------------------
+
+===========================================
+HalfSipHash 是 SipHash 的一个较不安全的变种
+===========================================
+
+：作者: Jason A.Donenfeld <jason@zx2c4.com>
+
+如果你认为SipHash的速度不够快，无法满足你的需求，那么你可以
+使用HalfSipHash，这是一种令人担忧但是有用的选择。HalfSipHash
+将SipHash的轮数从“2-4”降低到“1-3”，更令人担心的是，它使用一
+个容易被穷举攻击的64位密钥(输出为32位)，而不是SipHash的128位
+密钥，不过，这对于要求高性能“jhash”用户来说这是比较好的选择。
+
+HalfSipHash是通过 "hsiphash" 系列函数提供的。
+
+.. warning::
+   绝对不要在作为哈希表键函数之外使用hsiphash函数，只有在你
+   能完全能确定输出永远不会从内核传输出去的情况下才能使用，
+   作为缓解哈希表泛洪拒绝服务攻击的一种手段，它仅在某些情况
+   下比jhash好用。
+
+在64位的内核中，hsiphash函数实际上实现的是SipHash-1-3，这是一
+种减少轮数的SipHash变形，而不是HalfSipHash-1-3。这是因为在64位
+代码中SipHash-1-3的性能与HalfSipHash-1-3相当，甚至可能更快，请
+注意，这并不意味这在64位的内核中，hsihpash函数与siphash函数相
+同，也不意味着他们是安全的；hsihash函数仍然使用一种不太安全的
+减少轮数的算法，并将输出截断为32位。
+
+生成哈希密钥
+============
+
+密钥应始终来源于加密安全的随机数生成，要么使用get random bytes
+要么使用get random once::
+
+        hsiphash_key_t key;
+        get_random_bytes(&key, sizeof(key));
+
+如果你的钥匙来源不是这两个，那么你的做法是错的。
+
+使用哈希函数
+============
+
+这个函数有两种变体，一个是接受整数列表，另一种是接受缓冲区::
+
+        u32 hsiphash(const void *data, size_t len, const hsiphash_key_t *key);
+
+和::
+
+        u32 hsiphash_1u32(u32, const hsiphash_key_t *key);
+        u32 hsiphash_2u32(u32, u32, const hsiphash_key_t *key);
+        u32 hsiphash_3u32(u32, u32, u32, const hsiphash_key_t *key);
+        u32 hsiphash_4u32(u32, u32, u32, u32, const hsiphash_key_t *key);
+
+如果向一个通用的hsiphash函数传递一个恒定长度的常量，他将在编译
+的时候将常量折叠，并自动选择一个优化后的函数。
+
+哈希表键函数的用法
+==================
+
+::
+
+        struct some_hashtable {
+                DECLARE_HASHTABLE(hashtable, 8);
+                hsiphash_key_t key;
+        };
+
+        void init_hashtable(struct some_hashtable *table)
+        {
+                get_random_bytes(&table->key, sizeof(table->key));
+        }
+
+        static inline hlist_head *some_hashtable_bucket(struct some_hashtable *table, struct interesting_input *input)
+        {
+                return &table->hashtable[hsiphash(input, sizeof(*input), &table->key) & (HASH_SIZE(table->hashtable) - 1)];
+        }
+
+然后，你可以像往常一样对返回的哈希存储桶进行迭代。
+
+性能
+====
+
+hsiphash()大约比jhash()慢三倍，这是因为有许多替换，不过这些都不是问题，
+因为哈希表查找不是瓶颈。而且，这些牺牲是为了hsiphash()的安全性和DoS抗
+性，这是值得的。
-- 
2.47.1

