Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E3FE21CFEF;
	Fri, 22 May 2026 07:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.46.229.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779436689; cv=none; b=l7GugixlU5o4xKHovY7IV7IPjf9bb4ZIuqGXT5Cu4tnIS7p5D+VxyLkv5oSOwbCXbT59ZYeIxtp6Lxvc8N/2ukRV00TBe1g0kxE5EvySCXD8aTSF6Fx0aDkwiIZjIyrJSDQvFb3ISnZiebkr7mlvUeFFWtFxTVardh0cK0BlR5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779436689; c=relaxed/simple;
	bh=6DH+9GzQNL4JgPdR+fLOz+zXu0Y8QxxWz1x9Tzd67aE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=V+TA2Ej3nlr6MsOED85TU5WMYWykhVI7I/FCx9kJKh0UBiNx4WOuuhUnO8icg9SUuhcymPyZkG0fycfk/8KKh1ZNVjwdEQhJTpd6rBiZCJV+Oxc1cojQpXQlAIKoG4xyP2G4P0oTK1RNcCTmEAHTOFbYGY3ImbiaZrhy3k4XRt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chengyaqiang.com; spf=pass smtp.mailfrom=tsinghua.edu.cn; dkim=pass (1024-bit key) header.d=tsinghua.edu.cn header.i=@tsinghua.edu.cn header.b=BeLBGwoY; arc=none smtp.client-ip=207.46.229.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chengyaqiang.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tsinghua.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tsinghua.edu.cn header.i=@tsinghua.edu.cn header.b="BeLBGwoY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=tsinghua.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Sender; bh=8VgIbpLspPVuSJVo2v5T1RA0Ear2/5R2/IA8MuULdwA=; b=BeLBG
	woYl/D98nGbncrLGXxaV9QuwBbrukrFyVBMPwu0In6gugYEs2zEqT/xbXdgFyPTw
	q4D+fp5gPTuXvyWZ5COZ5WXnuCpBt2JKUPYr3mbPg2RCso1JuABEcL7o3RGcDssF
	LIKURrbp75RKSjkcBZwrUhi6EFoiejVcYsHlyg=
Received: from mail.tsinghua.edu.cn (unknown [114.244.130.223])
	by web2 (Coremail) with SMTP id yQQGZQD3hJxwDBBqRpm0AQ--.15810S2;
	Fri, 22 May 2026 15:57:37 +0800 (CST)
From: chengyaqiang <chengyaqiang@chengyaqiang.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chengyaqiang@tsinghua.edu.cn
Subject: [PATCH] docs/zh_CN: fix KASAN SW_TAGS mode description
Date: Fri, 22 May 2026 15:57:35 +0800
Message-Id: <20260522075735.2022734-1-chengyaqiang@chengyaqiang.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:yQQGZQD3hJxwDBBqRpm0AQ--.15810S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw4fKFyDJFy3JrWDuw47XFb_yoW8XF13pF
	y0krWIyF1Ivr15GrW8CF4DGryUGFn3GFW5G3ZxXa4Yqrs5J39Yyr1Ykr9FqFyxuwn3AFWY
	yFsakryavryqywUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Gb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4
	CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26r4r
	Kr1UJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0aVACjI8F5VA0II
	8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_JF0_Jw1lc2xSY4AK67AK6r4xMxAIw28IcxkI
	7VAKI48JMxAIw28IcVAKzI0EY4vE52x082I5MxAIw28IcVCjz48v1sIEY20_GrWkJr1UJw
	CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
	14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
	IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxK
	x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
	0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IUUqXdUUUUUU==
Sender: chengyaqiang@tsinghua.edu.cn
X-CM-SenderInfo: xfkh0w51dtxttqj632xlqjx3vdohv3gofq/1tbiAgMPB2oP+G0oeAABso

From: chengyaqiang <chengyaqiang@tsinghua.edu.cn>

CONFIG_KASAN_SW_TAGS enables Software Tag-Based KASAN mode, not Hardware
Tag-Based mode. Fix the incorrect translation in the Chinese documentation.

The original text incorrectly described both CONFIG_KASAN_SW_TAGS and
CONFIG_KASAN_HW_TAGS as "基于硬件标签" (hardware tag-based).  Correct
CONFIG_KASAN_SW_TAGS to "基于软件标签" (software tag-based).

Signed-off-by: chengyaqiang <chengyaqiang@tsinghua.edu.cn>
---
 Documentation/translations/zh_CN/dev-tools/kasan.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/dev-tools/kasan.rst b/Documentation/translations/zh_CN/dev-tools/kasan.rst
index fd2e3afbdfad..767b280d8af0 100644
--- a/Documentation/translations/zh_CN/dev-tools/kasan.rst
+++ b/Documentation/translations/zh_CN/dev-tools/kasan.rst
@@ -79,7 +79,7 @@ KASAN只支持SLUB。
 	  CONFIG_KASAN=y
 
 同时在 ``CONFIG_KASAN_GENERIC`` (启用通用KASAN模式)， ``CONFIG_KASAN_SW_TAGS``
-(启用基于硬件标签的KASAN模式)，和 ``CONFIG_KASAN_HW_TAGS`` (启用基于硬件标签
+(启用基于软件标签的KASAN模式)，和 ``CONFIG_KASAN_HW_TAGS`` (启用基于硬件标签
 的KASAN模式)之间进行选择。
 
 对于软件模式，还可以在 ``CONFIG_KASAN_OUTLINE`` 和 ``CONFIG_KASAN_INLINE``
-- 
2.39.5

